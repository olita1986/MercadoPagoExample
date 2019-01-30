//
//  PaymentSelectionModels.swift
//  MercadoPagoExample
//
//  Created by Nisum on 1/27/19.
//  Copyright (c) 2019 Nisum. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum PaymentSelection {
    // MARK: Use cases

    enum Something {
        struct Request {
        }
        struct Response {
        }
        struct ViewModel {
        }
    }

    enum PaymentMethods {
        struct Response {
            var paymentMethods: PaymentMethodsResponse
        }

        struct ViewModel {
            struct DisplayedPaymentMethods: OptionViewModel {
                var name: String
                var imageURL: String
            }
            var displayedPaymentMethodsArray: [DisplayedPaymentMethods]
        }
    }

    enum BankIssuers {
        struct Request {
            var index: Int
        }
    }

    enum Error {
        struct ViewModel {
            var title: String
            var message: String 
        }
    }
}