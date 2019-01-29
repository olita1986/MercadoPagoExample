//
//  PaymentSelectionViewController.swift
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

protocol PaymentSelectionDisplayLogic: class {
    func displayLoading()
    func dismissLoading()
    func displayView(viewModel: PaymentSelection.PaymentMethods.ViewModel)
    func displayBankIssuers()
    func displayError(viewModel: PaymentSelection.Error.ViewModel)
}

class PaymentSelectionViewController: UIViewController, PaymentSelectionDisplayLogic {
    var interactor: PaymentSelectionBusinessLogic?
    var router: (NSObjectProtocol & PaymentSelectionRoutingLogic & PaymentSelectionDataPassing)?

    @IBOutlet weak var paymentMethodsTableView: UITableView!


    var displayedPaymentMethodsArray = [PaymentSelection.PaymentMethods.ViewModel.DisplayedPaymentMethods]() {
        didSet {
            paymentMethodsTableView.reloadData()
        }
    }
    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = PaymentSelectionInteractor()
        let presenter = PaymentSelectionPresenter()
        let router = PaymentSelectionRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        interactor?.getPaymentMethods()
    }

    private func setupViews() {
        title = "Payment Methods"
        setupPaymentMethodsTableView()
    }

    private func setupPaymentMethodsTableView() {
        paymentMethodsTableView.delegate = self
        paymentMethodsTableView.dataSource = self

        paymentMethodsTableView.register(UINib(nibName: "StandardTableViewCell", bundle: nil), forCellReuseIdentifier: "paymentMethodCell")
    }

    func displayLoading() {

    }

    func dismissLoading() {

    }

    func displayView(viewModel: PaymentSelection.PaymentMethods.ViewModel) {
        self.displayedPaymentMethodsArray = viewModel.displayedPaymentMethodsArray
    }

    func displayBankIssuers() {
        router?.routeToBankIssuers()
    }

    func displayError(viewModel: PaymentSelection.Error.ViewModel) {
        let alert = UIAlertController(title: viewModel.message, message: viewModel.message, preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
    }
}

extension PaymentSelectionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedPaymentMethodsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let paymentMethod = displayedPaymentMethodsArray[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "paymentMethodCell", for: indexPath) as? StandardTableViewCell else { return UITableViewCell()}

        cell.setupCell(withOption: paymentMethod)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let request = PaymentSelection.BankIssuers.Request(paymentMethodId: "")
        interactor?.getBankIssuers(request: request)
    }
}


