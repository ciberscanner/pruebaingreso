//
//  PostConfigurator.swift
//  Prueba de ingreso
//
//  Created by Diego Fernando Serna Salazar on 27.09.21.
//

import Foundation

class PostConfigurator: PostConfiguratorProtocol {
    func configure(with viewController: PostViewController) {
        let presenter = PostPresenter(view: viewController)
        let interactor = PostInteractor(presenter: presenter)
        let router = PostRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
