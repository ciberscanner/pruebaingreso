//
//  MockedData.swift
//  Prueba de ingresoTests
//
//  Created by Diego Fernando Serna Salazar on 28.09.21.
//

import Foundation
import Mocker
public final class MockedData {
    //--------------------------------------------------------------------
    //Variables
    public static let usersJSON: URL = Bundle(for: MockedData.self).url(forResource: "users", withExtension: "json")!
    public static let postsJSON: URL = Bundle(for: MockedData.self).url(forResource: "Resources/JSON/posts", withExtension: "json")!
    public static let exampJSON: URL = Bundle(for: MockedData.self).url(forResource: "Resources/JSON Files/example", withExtension: "json")!
}
