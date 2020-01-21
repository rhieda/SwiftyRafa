//
//  SwiftlibTests.swift
//  SwiftyRafaTests
//
//  Created by Rafael  Hieda on 1/20/20.
//  Copyright © 2020 DevelopersUnited. All rights reserved.
//

import XCTest
@testable import SwiftyRafa

class SwiftlibTests: XCTestCase {
    
    var sut : Swiftlib!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = Swiftlib()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testShouldSumValuesCorrectly() {
        XCTAssertEqual(sut.add(a: 1, b: 1), 2)
    }
    
    func testShouldSubtractValuesCorrectly() {
        XCTAssertEqual(sut.sub(a: 1, b: 1), 0)
    }
    
    func testShouldMultiplyValuesCorrectly() {
        XCTAssertEqual(sut.mult(a: 3, b: 1), 3)
    }
    
    

}
