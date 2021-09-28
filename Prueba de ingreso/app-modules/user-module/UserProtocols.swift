//
//  UserProtocols.swift
//  Prueba de ingreso
//
//  Created by Diego Fernando Serna Salazar on 26.09.21.
//

import Foundation
//--------------------------------------------------------------------
//
protocol UserViewToPresenterProtocol: class {
    var view: UserPresenterToViewProtocol? {get set}
    var interactor: UserPresenterToInteractorProtocol? {get set}
    var router: UserPresenterToRouterProtocol? {get set}
    
    var users: [User] {get}
    var posts: [Post] {get}
    
    func getUsers()
    func getPosts()
    func showViewController(user:User)
}
//--------------------------------------------------------------------
//
protocol UserPresenterToViewProtocol: class {
    func showUsers()
    func showMessage(title:String, message: String)
}
//--------------------------------------------------------------------
//
protocol UserPresenterToInteractorProtocol: class {
    var presenter:UserInteractorToPresenterProtocol? {get set}
    
    func getPosts(completion: @escaping (Result<[Post], NetworkingError>) -> Void)
    func getUsers(completion: @escaping(Result<[User], NetworkingError>) -> Void)
}
//--------------------------------------------------------------------
//
protocol UserInteractorToPresenterProtocol: class {
    func getCollectionFailed(title: String, message: String)
}
//--------------------------------------------------------------------
//
protocol UserPresenterToRouterProtocol {
    func showViewController(user: User)
}
//--------------------------------------------------------------------
//
protocol UserConfiguratorProtocol: class {
    func configure(with viewController: UserViewController)
}
