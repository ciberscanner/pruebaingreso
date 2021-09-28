//
//  PostProtocols.swift
//  Prueba de ingreso
//
//  Created by Diego Fernando Serna Salazar on 27.09.21.
//

import Foundation
import UIKit

protocol PostViewToPresenterProtocol: class {
    var view: PostPresenterToViewProtocol? {get set}
    var interactor: PostPresenterToInteractorProtocol? {get set}
    var router: PostPresenterToRouterProtocol? {get set}
    
    var posts: [Post] {get}
    func getCollection(id: Int)
}

protocol PostPresenterToViewProtocol: class {
    func showCollection()
    func showMessage(title:String, message: String)
}

protocol PostPresenterToInteractorProtocol: class {
    var presenter:PostInteractorToPresenterProtocol? {get set}
    func getCollection(id: Int,completion: @escaping (Result<[Post], NetworkingError>) -> Void)
}

protocol PostInteractorToPresenterProtocol: class {
    func getCollectionFailed(title: String, message: String)
}

protocol PostPresenterToRouterProtocol {
    //func showViewController()
}

protocol PostConfiguratorProtocol {
    func configure(with viewController: PostViewController)
}
