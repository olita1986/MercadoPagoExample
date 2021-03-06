//
//  InstallmentSelectionViewController.swift
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

protocol InstallmentSelectionDisplayLogic: class {
    func displayView(viewModel: InstallmentSelection.Installment.ViewModel)
    func displaySummary()
}

class InstallmentSelectionViewController: UIViewController, InstallmentSelectionDisplayLogic {
    var interactor: InstallmentSelectionBusinessLogic?
    var router: (NSObjectProtocol & InstallmentSelectionRoutingLogic & InstallmentSelectionDataPassing)?

    @IBOutlet weak var installmentsTableView: UITableView!

    var displayedInstallmentsArray = [InstallmentSelection.Installment.ViewModel.DisplayedInstallment]() {
        didSet {
            installmentsTableView.reloadData()
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
        let interactor = InstallmentSelectionInteractor()
        let presenter = InstallmentSelectionPresenter()
        let router = InstallmentSelectionRouter()
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
        interactor?.getInstallments()
    }

    private func setupViews() {
        title = "Installments"
        setupInstallmentsTableView()
    }

    private func setupInstallmentsTableView() {
        installmentsTableView.delegate = self
        installmentsTableView.dataSource = self

        installmentsTableView.register(UINib(nibName: "InstallmentTableViewCell", bundle: nil), forCellReuseIdentifier: "installmentCell")
    }

    func displayView(viewModel: InstallmentSelection.Installment.ViewModel) {
        self.displayedInstallmentsArray = viewModel.displayedInstallments
    }

    func displaySummary() {
        router?.routeToSummary()
    }
}

extension InstallmentSelectionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedInstallmentsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let installment = displayedInstallmentsArray[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "installmentCell", for: indexPath) as? InstallmentTableViewCell else { return UITableViewCell()}

        cell.setupCell(withInstallment: installment)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let request = InstallmentSelection.Summary.Request(index: indexPath.row)
        interactor?.getToSummary(request: request)
    }
}
