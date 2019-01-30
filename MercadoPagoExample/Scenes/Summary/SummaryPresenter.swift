//
//  SummaryPresenter.swift
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

protocol SummaryPresentationLogic {
    func presentSummary(response: Summary.Summary.Response)
}

class SummaryPresenter: SummaryPresentationLogic {
    weak var viewController: SummaryDisplayLogic?

    func presentSummary(response: Summary.Summary.Response) {
        let displayedSummary = Summary.Summary.ViewModel.DisplayedSummary(installments: response.installments, installmentValue: "$ \(response.installmentValue)", amount: "$ \(response.amount)", totalAmount: "$ \(response.totalAmount)", paymentMethod: response.paymentMethod, issuer: response.issuer)
        let viewModel = Summary.Summary.ViewModel(displayedSummary: displayedSummary)
        viewController?.displaySummary(viewModel: viewModel)
    }
}
