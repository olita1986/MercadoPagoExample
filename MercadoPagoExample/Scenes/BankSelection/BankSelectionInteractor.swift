//
//  BankSelectionInteractor.swift
//  MercadoPagoExample
//
//  Created by Orlando Arzola on 1/27/19.
//  Copyright (c) 2019 Orlando Arzola. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol BankSelectionBusinessLogic {
    func getBankIssuers()
    func getInstallments(request: BankSelection.Installment.Request)
}

protocol BankSelectionDataStore {
    var bankIssuers: BanksResponse! { get set }
    var installmentsResponse: InstallmentsResponse! { get set }
    var paymentFlowBuilder: PaymentFlowDataBuilder! { get set }
}

class BankSelectionInteractor: BankSelectionBusinessLogic, BankSelectionDataStore {
    var presenter: BankSelectionPresentationLogic?
    var worker: BankSelectionWorker?

    var bankIssuers: BanksResponse!
    var installmentsResponse: InstallmentsResponse!
    var paymentFlowBuilder: PaymentFlowDataBuilder!

    let mpeApi: MPEApi

    init(mpeApi: MPEApi = MPEApi()) {
        self.mpeApi = mpeApi
    }

    func getBankIssuers() {
        let response = BankSelection.BankIssuers.Response(bankIssuersResponse: bankIssuers)
        presenter?.presentView(response: response)
    }

    func getInstallments(request: BankSelection.Installment.Request) {
        presenter?.presentLoading()
        let issuer = bankIssuers[request.index]
        let paymentData = paymentFlowBuilder.withSelectedIssuer(issuer: issuer).build()
        mpeApi.getInstallments(withPaymentMethodId: paymentData.selectedPaymentMethod.id, amount: paymentData.amount, issuerId: issuer.id) { [weak self](installments) in
            self?.presenter?.dismissLoading()
            if let installmentsResponse = installments {
                self?.installmentsResponse = installmentsResponse
                self?.presenter?.presentInstallments()
            } else {
                self?.presenter?.presentError()
            }
        }
    }
}
