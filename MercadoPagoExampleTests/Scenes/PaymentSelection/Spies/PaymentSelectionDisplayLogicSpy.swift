//
//  PaymentSelectionDisplayLogicSpy.swift
//  MercadoPagoExampleTests
//
//  Created by Orlando Arzola on 1/29/19.
//  Copyright © 2019 Orlando Arzola. All rights reserved.
//

import Foundation
@testable import MPEDebug

class PaymentSelectionDisplayLogicSpy: PaymentSelectionDisplayLogic {

    var displayLoadingCalled = false
    var dismissLoadingCalled = false
    var displayViewCalled = false
    var displayBankIssuersCalled = false
    var displayErrorCalled = false

    func displayLoading() {
        displayLoadingCalled = true
    }

    func dismissLoading() {
        dismissLoadingCalled = true
    }

    func displayView(viewModel: PaymentSelection.PaymentMethods.ViewModel) {
        displayViewCalled = true
    }

    func displayBankIssuers() {
        displayBankIssuersCalled = true
    }

    func displayError(viewModel: PaymentSelection.Error.ViewModel) {
        displayErrorCalled = true
    }
}
