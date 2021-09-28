//
//  PostTest.swift
//  Prueba de ingresoTests
//
//  Created by Diego Fernando Serna Salazar on 28.09.21.
//

import XCTest
import Mocker

@testable import Prueba_de_ingreso

class PostTest: XCTestCase {
    //--------------------------------------------------------------------
    //Variables
    let dataTest = DataTest()
    var view = PostMockView()
    var presenter:PostPresenter!
    var interactor:PostInteractor!
    //--------------------------------------------------------------------
    //
    override func setUp() {
        presenter = PostPresenter(view: view)
        interactor = PostInteractor(presenter: presenter)
        presenter.interactor = interactor
    }
    //--------------------------------------------------------------------
    //
    func testGetPosts() throws {
        let path = Paths.userPosts.rawValue
        let apiEndpoint = URL(string: "\(Networking.Domain.develop.rawValue)\(path)")!

        let mock = Mock(url: apiEndpoint, ignoreQuery: true,  dataType: .json, statusCode: 200, data: [.get: dataTest.getPostData()])
        mock.register()

        let requestExpectation = expectation(description: "Request should finish")
        
        interactor.getCollection(id: 1){ result in
            switch result {
            case let .success(posts):
                XCTAssertGreaterThan(posts.count, 5)
                requestExpectation.fulfill()
            case .failure:
                XCTFail("Request should succeed")
            }
        }
        wait(for: [requestExpectation],timeout: 10.0)
    }

}
