//
//  LocalStorageTest.swift
//  Prueba de ingresoTests
//
//  Created by Diego Fernando Serna Salazar on 28.09.21.
//

import XCTest

class LocalStorageTest: XCTestCase {
    //--------------------------------------------------------------------
    //Variables
    let localStorage = LocalStorage()
    let dataTest = DataTest()
    //--------------------------------------------------------------------
    //
    override func setUpWithError() throws {
    }
    //--------------------------------------------------------------------
    //
    func testSaveData() {
        let data = dataTest.getUserData()
        localStorage.saveData(data: data, key: "usersTesting")
        
        let users = localStorage.getUsers(key: "usersTesting")
        
        XCTAssertGreaterThan(users.count, 0)
    }
    //--------------------------------------------------------------------
    //
    func testGetUsers() {
        let users = localStorage.getUsers(key: "usersTesting")
        XCTAssertGreaterThan(users.count, 0)
    }

}
