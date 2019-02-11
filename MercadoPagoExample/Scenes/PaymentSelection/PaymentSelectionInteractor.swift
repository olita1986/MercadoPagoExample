//
//  PaymentSelectionInteractor.swift
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

protocol PaymentSelectionBusinessLogic {
    func getPaymentMethods()
    func getBankIssuers(request: PaymentSelection.BankIssuers.Request)
}

protocol PaymentSelectionDataStore {
    var bankIssuers: BanksResponse! { get set }
    var paymentFlowBuilder: PaymentFlowDataBuilder! { get set }
}

class PaymentSelectionInteractor: PaymentSelectionBusinessLogic, PaymentSelectionDataStore {
    var presenter: PaymentSelectionPresentationLogic?
    var worker: PaymentSelectionWorker?

    private var paymentMethods: PaymentMethodsResponse!
    var bankIssuers: BanksResponse!
    var paymentFlowBuilder: PaymentFlowDataBuilder!

    let mpeApi: MPEApi

    init(mpeApi: MPEApi = MPEApi()) {
        self.mpeApi = mpeApi
    }

    func getPaymentMethods() {
        presenter?.presentLoading()
        mpeApi.getPaymentMethods { [weak self](paymentMethodsResponse) in
            self?.presenter?.dismissLoading()
            if let paymentMethods = paymentMethodsResponse {
                self?.paymentMethods = paymentMethods
                let response = PaymentSelection.PaymentMethods.Response(paymentMethods: paymentMethods)
                self?.presenter?.presentView(response: response)
            } else {
                self?.presenter?.presentError()
            }
        }
    }

    func getBankIssuers(request: PaymentSelection.BankIssuers.Request) {
        presenter?.presentLoading()
        let paymentMethod = paymentMethods[request.index]
        _ = paymentFlowBuilder.withSelectedPaymentMethod(method: paymentMethod)
        mpeApi.getIssuers(withPaymentMethodId: paymentMethod.id) { [weak self](bankIssuersResponse) in
            self?.presenter?.dismissLoading()
            if let bankIssuers = bankIssuersResponse, bankIssuers.count > 0 {
                self?.bankIssuers = bankIssuers
                self?.presenter?.presentBankIssuers()
            } else {
                self?.presenter?.presentError()
            }
        }
    }
}
