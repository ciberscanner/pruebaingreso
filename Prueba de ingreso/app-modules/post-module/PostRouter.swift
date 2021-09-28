//
//  PostRouter.swift
//  Prueba de ingreso
//
//  Created by Diego Fernando Serna Salazar on 27.09.21.
//

import Foundation
import UIKit

class PostRouter: PostPresenterToRouterProtocol {
    //--------------------------------------------------------------------
    //Variables
    weak var viewController:PostViewController?
    var id = -1
    //--------------------------------------------------------------------
    //
    init(viewController:PostViewController) {
        self.viewController = viewController
    }
}
