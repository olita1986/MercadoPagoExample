//
//  InstallmentSelectionModels.swift
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

enum InstallmentSelection {
    // MARK: Use cases

    enum Something {
        struct Request {
        }
        struct Response {
        }
        struct ViewModel {
        }
    }

    enum Installment {
        struct Response {
            var installmentsResponse: InstallmentsResponse
        }

        struct ViewModel {
            struct DisplayedInstallment {
                var recommendedMessage: String
                var installments: String
                var installmentValue: String
                var totalAmount: String
            }

            var displayedInstallments: [DisplayedInstallment]
        }
    }
}
