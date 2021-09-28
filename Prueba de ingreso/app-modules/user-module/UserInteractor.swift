//
//  UserInteractor.swift
//  Prueba de ingreso
//
//  Created by Diego Fernando Serna Salazar on 26.09.21.
//

import Foundation
import Alamofire

enum Paths: String {
    case userList = "users"
    case postList = "posts"
    case userPosts = "posts?userId="
}

class UserInteractor: UserPresenterToInteractorProtocol {
    //--------------------------------------------------------------------
    //Variables
    var presenter: UserInteractorToPresenterProtocol?
    var localStorage = LocalStorage()
    //--------------------------------------------------------------------
    //
    required init(presenter: UserInteractorToPresenterProtocol){
        self.presenter = presenter
    }
    //--------------------------------------------------------------------
    //
    func getUsers(completion: @escaping (Result<[User], NetworkingError>) -> Void) {
        let usersLocal = localStorage.getUsers(key: "users")
        if usersLocal.count>0{
            completion(.success(usersLocal))
            return
        }
        
        Networking(path: String(format: Paths.userList.rawValue) , method: .get).execute(withCodable: [User].self) { (result) in
            completion(result)
        }
    }
    //--------------------------------------------------------------------
    //
    func getPosts(completion: @escaping (Result<[Post], NetworkingError>) -> Void) {
        let postsLocal = localStorage.getPosts(key: "posts")
        if postsLocal.count>0{
            completion(.success(postsLocal))
            return
        }
        
        Networking(path: String(format: Paths.postList.rawValue) , method: .get).execute(withCodable: [Post].self) { (result) in
            completion(result)
        }
    }
}
