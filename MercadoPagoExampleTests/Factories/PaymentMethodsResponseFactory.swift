//
//  PaymentMethodsResponseFactory.swift
//  MercadoPagoExampleTests
//
//  Created by Orlando Arzola on 1/30/19.
//  Copyright © 2019 Orlando Arzola. All rights reserved.
//

import Foundation
@testable import MPEDebug


class PaymentMethodsResponseFactory {
    class func generateModel() -> PaymentMethodsResponse {
        return [PaymentMethodsElement(id: "visa", name: "Visa", thumbnail: "url", secureThumbnail: "url")]
    }
}
