//
//  AmountInputPresenter.swift
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

protocol AmountInputPresentationLogic {
    func presentEnabledContinueButton()
    func presentDisabledContinueButton()
}

class AmountInputPresenter: AmountInputPresentationLogic {
    weak var viewController: AmountInputDisplayLogic?

    func presentEnabledContinueButton() {
        viewController?.displayEnabledContinueButton()
    }

    func presentDisabledContinueButton() {
        viewController?.displayDisabledContinueButton()
    }
}
