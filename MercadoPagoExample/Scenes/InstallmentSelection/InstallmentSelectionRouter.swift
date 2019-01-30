//
//  InstallmentSelectionRouter.swift
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

@objc protocol InstallmentSelectionRoutingLogic {
    func routeToSummary()
}

protocol InstallmentSelectionDataPassing {
    var dataStore: InstallmentSelectionDataStore? { get }
}

class InstallmentSelectionRouter: NSObject, InstallmentSelectionRoutingLogic, InstallmentSelectionDataPassing {
    weak var viewController: InstallmentSelectionViewController?
    var dataStore: InstallmentSelectionDataStore?

    // MARK: Routing

    func routeToSummary() {
        let destinationVC = SummaryViewController()
        var destinationDS = destinationVC.router!.dataStore!
        passDataToSummary(source: dataStore!, destination: &destinationDS)
        navigateToSummary(source: viewController!, destination: destinationVC)
    }

    // MARK: Navigation

    func navigateToSummary(source: InstallmentSelectionViewController, destination: SummaryViewController)
    {
      source.navigationController?.pushViewController(destination, animated: true)
    }

    // MARK: Passing data

    func passDataToSummary(source: InstallmentSelectionDataStore, destination: inout SummaryDataStore)
    {
        destination.amount = source.amount
        destination.installments = String(source.installment.installments)
        destination.installmentValue = String(source.installment.installmentAmount)
        destination.issuer = source.installmentsResponse[0].issuer.name
        destination.paymentMethod = source.paymentMethod.name
        destination.totalAmount = String(source.installment.totalAmount)
    }
}
