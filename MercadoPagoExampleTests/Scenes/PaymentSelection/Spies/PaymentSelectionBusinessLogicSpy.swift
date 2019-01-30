//
//  PaymentSelectionBusinessLogicSpy.swift
//  MercadoPagoExampleTests
//
//  Created by Orlando Arzola on 1/29/19.
//  Copyright © 2019 Orlando Arzola. All rights reserved.
//

import Foundation
@testable import MPEDebug

class PaymentSelectionBusinessLogicSpy: PaymentSelectionBusinessLogic {

    var getPaymentMethodsCalled = false
    var getBankIssuersCalled = false
    
    func getPaymentMethods() {
        getPaymentMethodsCalled = true
    }

    func getBankIssuers(request: PaymentSelection.BankIssuers.Request) {
        getBankIssuersCalled = true
    }
}
