//
//  DataApp.swift
//  Prueba de ingreso
//
//  Created by Diego Fernando Serna Salazar on 27.09.21.
//

import Foundation
import Alamofire
import UIKit
public class LocalStorage{
    //--------------------------------------------------------------------
    //Variables
    private let defaults: UserDefaults
    //--------------------------------------------------------------------
    //
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    //--------------------------------------------------------------------
    //
    func saveData(data: Data, key: String) {
        defaults.set(data, forKey: key)
    }
    //--------------------------------------------------------------------
    //
    func getUsers(key: String) -> Array<User> {
        if let data = defaults.data(forKey: key) {
            do {
                let decoder = JSONDecoder()
                let users = try decoder.decode([User].self, from: data)
                print("Load \(users.count) users from local")
                return users
            } catch {
                print("Unable to Decode Users (\(error))")
                return Array<User>()
            }
        }else{
            return Array<User>()
        }
    }
    //--------------------------------------------------------------------
    //
    func getPosts(key: String) -> Array<Post> {
        if let data = defaults.data(forKey: key) {
            do {
                let decoder = JSONDecoder()
                let posts = try decoder.decode([Post].self, from: data)
                print("Load \(posts.count) posts from local")
                return posts
            } catch {
                print("Unable to Decode Posts (\(error))")
                return Array<Post>()
            }
        }else{
            return Array<Post>()
        }
    }
}
