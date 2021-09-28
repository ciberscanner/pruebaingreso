//
//  UserPresenter.swift
//  Prueba de ingreso
//
//  Created by Diego Fernando Serna Salazar on 26.09.21.
//

import UIKit

class UserPresenter:UserViewToPresenterProtocol {
    //--------------------------------------------------------------------
    //Variables
    var view: UserPresenterToViewProtocol?
    var interactor: UserPresenterToInteractorProtocol?
    var router: UserPresenterToRouterProtocol?
    
    var users: [User]
    var posts: [Post]
    //--------------------------------------------------------------------
    //
    required init(view:UserPresenterToViewProtocol){
        self.view = view
        users = Array<User>()
        posts = Array<Post>()
    }
    //--------------------------------------------------------------------
    //
    init(){
        users = Array<User>()
        posts = Array<Post>()
    }
    //--------------------------------------------------------------------
    //
    func showViewController(user: User) {
        router?.showViewController(user: user)
    }
    //--------------------------------------------------------------------
    //
    func getUsers() {
        interactor?.getUsers(){[weak self] result in
            switch result {
            case let .success(list):
                if !list.isEmpty {
                    self?.users.append(contentsOf: list)
                    self?.view?.showUsers()
                } else {
                    print("list user empty")
                }

            case let .failure(error):
                print("Error: \(error)")
            }
        }
    }
    //--------------------------------------------------------------------
    //
    func getPosts(){
        interactor?.getPosts(){[weak self] result in
            switch result {
            case let .success(list):
                if !list.isEmpty {
                    self?.posts.append(contentsOf: list)
                    self?.view?.showUsers()
                } else{
                    print("Lista post vacia")
                }

            case let .failure(error):
                print("Error: \(error)")
            }
        }
    }
}
//MARK: -
extension UserPresenter: UserInteractorToPresenterProtocol{
    //--------------------------------------------------------------------
    //
    func getCollectionFailed(title: String, message: String) {
        view?.showMessage(title:title, message: message)
    }
}
