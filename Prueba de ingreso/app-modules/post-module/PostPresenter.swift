//
//  PostPresenter.swift
//  Prueba de ingreso
//
//  Created by Diego Fernando Serna Salazar on 27.09.21.
//

import Foundation
import UIKit

class PostPresenter:PostViewToPresenterProtocol {
    //--------------------------------------------------------------------
    //Variables
    var view: PostPresenterToViewProtocol?
    var interactor: PostPresenterToInteractorProtocol?
    var router: PostPresenterToRouterProtocol?
    var posts: [Post]
    //--------------------------------------------------------------------
    //
    required init(view:PostPresenterToViewProtocol){
        self.view = view
        posts = Array<Post>()
    }
    //--------------------------------------------------------------------
    //
    func getCollection(id: Int){
        interactor?.getCollection(id: id){[weak self] result in
            switch result {
            case let .success(list):
                if !list.isEmpty {
                    self?.posts.append(contentsOf: list)
                    self?.view?.showCollection()
                }else {
                    print("No hay post para este usuario ID: \(id)")
                }

            case let .failure(error):
                print("Error: \(error)")
            }
        }
    }
}

extension PostPresenter: PostInteractorToPresenterProtocol{
    func getCollectionFailed(title: String, message: String){
        view?.showMessage(title: title, message: message)
    }
}
