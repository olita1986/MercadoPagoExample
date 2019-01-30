//
//  PaymentSelectionRoutingLogicSpy.swift
//  MercadoPagoExampleTests
//
//  Created by Orlando Arzola on 1/30/19.
//  Copyright © 2019 Orlando Arzola. All rights reserved.
//

import Foundation
@testable import MPEDebug

class PaymentSelectionRoutingLogicSpy: NSObject, PaymentSelectionRoutingLogic, PaymentSelectionDataPassing {
    var dataStore: PaymentSelectionDataStore?

    var routeToBankIssuersCalled = false
    func routeToBankIssuers() {
        routeToBankIssuersCalled = true
    }
}
