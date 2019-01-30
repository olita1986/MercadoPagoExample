//
//  BanksResponseFactory.swift
//  MercadoPagoExampleTests
//
//  Created by Orlando Arzola on 1/30/19.
//  Copyright © 2019 Orlando Arzola. All rights reserved.
//

import Foundation
@testable import MPEDebug

class BanksResponseFactory {
    class func generateModel() -> BanksResponse {
        return [BanksResponseElement(id: "288", name: "Banco", secureThumbnail: "url", thumbnail: "url", processingMode: "", merchantAccountID: nil)]
    }
}
