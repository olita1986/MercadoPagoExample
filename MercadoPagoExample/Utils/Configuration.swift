//
//  Configuration.swift
//  MercadoPagoExample
//
//  Created by Orlando Arzola on 1/28/19.
//  Copyright © 2019 Orlando Arzola. All rights reserved.
//

import Foundation

struct Configuration {
    static var productName: String {
        return Bundle.main.infoDictionary!["CFBundleName"] as! String
    }
    struct Stubs {
        static var isEnable: Bool {
            let stubDictionary = Bundle.main.infoDictionary!["Stubs"] as! [String:Any]
            return stubDictionary[Configuration.productName.lowercased()] as! Bool
        }
    }
}
