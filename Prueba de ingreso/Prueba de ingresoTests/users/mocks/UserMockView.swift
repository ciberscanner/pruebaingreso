//
//  UserMockView.swift
//  Prueba de ingresoTests
//
//  Created by Diego Fernando Serna Salazar on 28.09.21.
//

@testable import Prueba_de_ingreso

class UserMockView:UserPresenterToViewProtocol {
    //--------------------------------------------------------------------
    //Variables
    var presenter:UserViewToPresenterProtocol?
    
    var isShowUserCalled = false
    var isSetPostCalled = false
    //--------------------------------------------------------------------
    //
    func showUsers() {
        isShowUserCalled = true
    }
    
    func setPosts() {
        isSetPostCalled = true
    }
    
    func showMessage(title: String, message: String) {
        
    }
}
