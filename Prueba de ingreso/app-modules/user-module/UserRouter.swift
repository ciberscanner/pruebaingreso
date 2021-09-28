//
//  UserRouter.swift
//  Prueba de ingreso
//
//  Created by Diego Fernando Serna Salazar on 26.09.21.
//

import Foundation
import UIKit

class UserRouter: UserPresenterToRouterProtocol {
    //--------------------------------------------------------------------
    //Variables
    weak var viewController:UserViewController?
    //--------------------------------------------------------------------
    //
    init(viewController:UserViewController) {
        self.viewController = viewController
    }
    //--------------------------------------------------------------------
    //
    func showViewController(user: User) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(identifier: "postViewController")as! PostViewController
            nextVC.user = user
            self.viewController!.show(nextVC, sender: self)
        }
    }
}
