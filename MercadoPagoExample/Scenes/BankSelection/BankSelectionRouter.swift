//
//  BankSelectionRouter.swift
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

@objc protocol BankSelectionRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    func routeToInstallments()
}

protocol BankSelectionDataPassing {
    var dataStore: BankSelectionDataStore? { get }
}

class BankSelectionRouter: NSObject, BankSelectionRoutingLogic, BankSelectionDataPassing {
    weak var viewController: BankSelectionViewController?
    var dataStore: BankSelectionDataStore?

    // MARK: Routing

    func routeToInstallments() {
        let destinationVC = InstallmentSelectionViewController()
        var destinationDS = destinationVC.router!.dataStore!
        passDataToInstallment(source: dataStore!, destination: &destinationDS)
        navigateToInstallment(source: viewController!, destination: destinationVC)
    }

    // MARK: Navigation

    func navigateToInstallment(source: BankSelectionViewController, destination: InstallmentSelectionViewController)
    {
        source.navigationController?.pushViewController(destination, animated: true)
    }

    // MARK: Passing data

    func passDataToInstallment(source: BankSelectionDataStore, destination: inout InstallmentSelectionDataStore)
    {
        destination.installmentsResponse = source.installmentsResponse
        destination.paymentFlowBuilder = source.paymentFlowBuilder
    }
}
