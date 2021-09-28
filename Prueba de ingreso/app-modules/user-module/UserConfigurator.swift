//
//  UserConfigurator.swift
//  Prueba de ingreso
//
//  Created by Diego Fernando Serna Salazar on 26.09.21.
//

import Foundation

class UserConfigurator: UserConfiguratorProtocol {
    
    func configure(with viewController: UserViewController) {
        let presenter = UserPresenter(view: viewController)
        let interactor = UserInteractor(presenter: presenter)
        let router = UserRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
