//
//  Memory_GameUITests.swift
//  Memory_GameUITests
//
//  Created by KHU_Taewoo on 2020/11/12.
//

import XCTest

class Memory_GameUITests: XCTestCase {
	
    override func setUpWithError() throws {
        continueAfterFailure = false
		XCUIApplication().launch();
    }

    override func tearDownWithError() throws {
    }

	func test_testcode() {
		XCTAssert(1==1)
	}
	
	
	func test_card () {
		
	}

}
