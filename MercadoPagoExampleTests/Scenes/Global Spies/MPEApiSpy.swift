//
//  MPEApiSpy.swift
//  MercadoPagoExampleTests
//
//  Created by Orlando Arzola on 1/30/19.
//  Copyright © 2019 Orlando Arzola. All rights reserved.
//

import Foundation
@testable import MPEDebug

class MPEApiSpy: MPEApi {

    var getPaymentMethodsCalled = false
    var getIssuersCalled = false
    var getInstallmentsCalled = false

    let isError: Bool

    init(isError: Bool = false) {
        self.isError = isError
    }
    override func getPaymentMethods(onSuccess: @escaping (PaymentMethodsResponse?) -> Void) {
        getPaymentMethodsCalled = true
        if isError {
            onSuccess(nil)
        } else {
            onSuccess(PaymentMethodsResponseFactory.generateModel())
        }
    }

    override func getIssuers(withPaymentMethodId id: String, onSuccess: @escaping (BanksResponse?) -> Void) {
        getIssuersCalled = true
        if isError {
            onSuccess(nil)
        } else {
            onSuccess(BanksResponseFactory.generateModel())
        }
    }

    override func getInstallments(withPaymentMethodId id: String, amount: String, issuerId: String, onSuccess: @escaping (InstallmentsResponse?) -> Void) {
        getInstallmentsCalled = true
        if isError {
            onSuccess(nil)
        } else {
            onSuccess(InstallmentsResponseFactory.generateModel())
        }
    }
}
