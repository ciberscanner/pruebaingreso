//
//  PostMock.swift
//  Prueba de ingresoTests
//
//  Created by Diego Fernando Serna Salazar on 28.09.21.
//

@testable import Prueba_de_ingreso

class PostMockView:PostPresenterToViewProtocol {
    //--------------------------------------------------------------------
    //Variables
    var presenter:PostViewToPresenterProtocol?
    
    var isShowCollectionCalled = false
    var isSetPostCalled = false
    //--------------------------------------------------------------------
    //
    func showMessage(title: String, message: String) {
        
    }
    //--------------------------------------------------------------------
    //
    func showCollection() {
        
    }

}
