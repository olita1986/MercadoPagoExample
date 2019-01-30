//
//  InstallmentsResponseFactory.swift
//  MercadoPagoExampleTests
//
//  Created by Orlando Arzola on 1/30/19.
//  Copyright © 2019 Orlando Arzola. All rights reserved.
//

import Foundation
@testable import MPEDebug

class InstallmentsResponseFactory {
    class func generateModel() -> InstallmentsResponse {
        return [InstallmentsResponseElement(paymentMethodID: "visa", paymentTypeID: "visa", issuer: Issuer(id: "288", name: "banco", secureThumbnail: "url", thumbnail: "url"), processingMode: "", merchantAccountID: nil, payerCosts: [PayerCost(installments: 6, installmentRate: 30.0, discountRate: 2, labels: [""], installmentRateCollector: [""], minAllowedAmount: 5, maxAllowedAmount: 1000, recommendedMessage: "message", installmentAmount: 200.0, totalAmount: 2000.0)])]
    }
}
