//
//  PostInteractor.swift
//  Prueba de ingreso
//
//  Created by Diego Fernando Serna Salazar on 27.09.21.
//

import Foundation
import Alamofire

class PostInteractor: PostPresenterToInteractorProtocol {
    //--------------------------------------------------------------------
    //Variables
    var presenter: PostInteractorToPresenterProtocol?
    let localStorage = LocalStorage()
    //--------------------------------------------------------------------
    //
    required init(presenter: PostInteractorToPresenterProtocol){
        self.presenter = presenter
    }
    //--------------------------------------------------------------------
    //GET Alamofire
    func getCollection(id: Int, completion: @escaping (Result<[Post], NetworkingError>) -> Void) {
        let postsLocal = localStorage.getPosts(key: "posts")
        if( postsLocal.count>0){
            let filterCollecion = filterCollection(collection: postsLocal, id: id)
            completion(.success(filterCollecion))
            return
        }
        
        Networking(path: String(format: Paths.userPosts.rawValue, id) , method: .get).execute(withCodable: [Post].self) { (result) in completion(result)
        }
    }
    //--------------------------------------------------------------------
    //
    func filterCollection(collection: Array<Post>, id: Int) -> Array<Post> {
        let filterCollection = collection.filter{$0.userID == id}
        print("Filter \(filterCollection.count) posts from local")
        return filterCollection
    }
}
