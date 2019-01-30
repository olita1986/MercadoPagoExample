//
//  SummaryModels.swift
//  MercadoPagoExample
//
//  Created by Orlando Arzola on 1/27/19.
//  Copyright (c) 2019 Orlando Arzola. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Summary {
    // MARK: Use cases

    enum Summary {
        struct Request {
        }
        struct Response {
            var installments: String
            var installmentValue: String
            var amount: String
            var totalAmount: String
            var paymentMethod: String
            var issuer: String
        }
        struct ViewModel {
            struct DisplayedSummary {
                var installments: String
                var installmentValue: String
                var amount: String
                var totalAmount: String
                var paymentMethod: String
                var issuer: String
            }

            var displayedSummary: DisplayedSummary
        }
    }
}
