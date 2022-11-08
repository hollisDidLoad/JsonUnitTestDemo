//
//  JsonUnitTestDemoTests.swift
//  JsonUnitTestDemoTests
//
//  Created by Hollis Kwan on 11/8/22.
//

import XCTest
@testable import JsonUnitTestDemo

final class JsonUnitTestDemoTests: XCTestCase {
    
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_networkManager_fetchModel() {
        guard let path = Bundle.main.path(forResource: "mockJson", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        var mockModel: JsonTestModel?
        do {
            let jsonData = try Data(contentsOf: url)
            mockModel = try JSONDecoder().decode(JsonTestModel.self, from: jsonData)
        //Then
            XCTAssertNotNil(mockModel)
        } catch {
            XCTFail("Error fetching mock json")
        }
    }
}
