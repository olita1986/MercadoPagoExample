//
//  PaymentSelectionPresentationLogicSpy.swift
//  MercadoPagoExampleTests
//
//  Created by Orlando Arzola on 1/29/19.
//  Copyright © 2019 Orlando Arzola. All rights reserved.
//

import Foundation
@testable import MPEDebug

class PaymentSelectionPresentationLogicSpy: PaymentSelectionPresentationLogic {

    var presentLoadingCalled = false
    var dismissLoadingCalled = false
    var presentViewCalled = false
    var presentBankIssuersCalled = false
    var presentErrorCalled = false

    func presentLoading() {
        presentLoadingCalled = true
    }

    func dismissLoading() {
        dismissLoadingCalled = true
    }

    func presentView(response: PaymentSelection.PaymentMethods.Response) {
        presentViewCalled = true
    }

    func presentBankIssuers() {
        presentBankIssuersCalled = true
    }

    func presentError() {
        presentErrorCalled = true
    }
}
