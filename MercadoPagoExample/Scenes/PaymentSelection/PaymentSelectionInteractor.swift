//
//  PaymentSelectionInteractor.swift
//  MercadoPagoExample
//
//  Created by Nisum on 1/27/19.
//  Copyright (c) 2019 Nisum. All rights reserved.
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
    var paymentMethods: PaymentMethodsResponse! { get set }
    var bankIssuers: BanksResponse! { get set }
    var amount: String! { get set }
    var paymentMethod: PaymentMethodsElement! { get set }
}

class PaymentSelectionInteractor: PaymentSelectionBusinessLogic, PaymentSelectionDataStore {
    var presenter: PaymentSelectionPresentationLogic?
    var worker: PaymentSelectionWorker?

    var paymentMethods: PaymentMethodsResponse!
    var bankIssuers: BanksResponse!
    var amount: String!
    var paymentMethod: PaymentMethodsElement!

    let mpeApi: MPEApi

    init(mpeApi: MPEApi = MPEApi()) {
        self.mpeApi = mpeApi
    }

    func getPaymentMethods() {
        presenter?.presentLoading()
        mpeApi.getPaymentMethods { [weak self](paymentMethodsResponse) in
            self?.presenter?.dismissLoading()
            self?.paymentMethods = paymentMethodsResponse != nil ? paymentMethodsResponse! : []
            let response = PaymentSelection.PaymentMethods.Response(paymentMethods: paymentMethodsResponse!)
            self?.presenter?.presentView(response: response)
        }
    }

    func getBankIssuers(request: PaymentSelection.BankIssuers.Request) {
        presenter?.presentLoading()
        let paymentMethod = paymentMethods[request.index]
        self.paymentMethod = paymentMethod
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
