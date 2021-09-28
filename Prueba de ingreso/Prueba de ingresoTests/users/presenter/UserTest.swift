//
//  UserTest.swift
//  Prueba de ingresoTests
//
//  Created by Diego Fernando Serna Salazar on 28.09.21.
//

import XCTest
import Mocker

@testable import Prueba_de_ingreso

class UserTest: XCTestCase {
    //--------------------------------------------------------------------
    //Variables
    let dataTest = DataTest()
    var view = UserMockView()
    var presenter:UserPresenter!
    var interactor:UserInteractor!
    //--------------------------------------------------------------------
    //
    override func setUp() {
        presenter = UserPresenter(view: view)
        interactor = UserInteractor(presenter: presenter)
        presenter.interactor = interactor
    }
    
    func testGetPosts() throws {
        let path = Paths.userPosts.rawValue
        let apiEndpoint = URL(string: "\(Networking.Domain.develop.rawValue)\(path)")!

        let mock = Mock(url: apiEndpoint, ignoreQuery: true,  dataType: .json, statusCode: 200, data: [.get: dataTest.getPostData()])
        mock.register()

        let requestExpectation = expectation(description: "Request should finish")
        
        interactor.getPosts(){ result in
            switch result {
            case let .success(posts):
                XCTAssertGreaterThan(posts.count, 10)
                requestExpectation.fulfill()
            case .failure:
                XCTFail("Request should succeed")
            }
        }
        wait(for: [requestExpectation],timeout: 10.0)
    }
    //--------------------------------------------------------------------
    //
    func testGetUsers() throws {
        let path = Paths.userList.rawValue
        let apiEndpoint = URL(string: "\(Networking.Domain.develop.rawValue)\(path)")!

        let mock = Mock(url: apiEndpoint, ignoreQuery: true,  dataType: .json, statusCode: 200, data: [.get: dataTest.getUserData()])
        mock.register()

        let requestExpectation = expectation(description: "Request should finish")
        
        interactor.getUsers(){ result in
            switch result {
            case let .success(users):
                XCTAssertGreaterThan(users.count, 5)
                requestExpectation.fulfill()
            case .failure:
                XCTFail("Request should succeed")
            }
        }
        wait(for: [requestExpectation],timeout: 10.0)
    }

}
