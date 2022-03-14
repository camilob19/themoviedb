//
//  MovieDetailUITests.swift
//  TheMoviewDBUITests
//
//  Created by Camilo Betancourt on 14/03/22.
//

import XCTest

class MovieDetailUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLikeSuccess() throws {
        let app = XCUIApplication()
        app.launch()
        
        let movieButton = app.buttons["414906"]
        XCTAssertTrue(movieButton.waitForExistence(timeout: 5))
        movieButton.tap()
        
        XCTAssertTrue(app.staticTexts["Overview"].exists)
        
        app.buttons["likeButton"].tap()
        
        XCTAssertTrue(app.images["likeFill"].exists)
        
    }
}
