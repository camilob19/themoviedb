//
//  LikeMovieUITests.swift
//  TheMoviewDBUITests
//
//  Created by Camilo Betancourt on 15/03/22.
//

import XCTest

class LikeMovieUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }
    
    func testGoLikes() throws {
        let app = XCUIApplication()
        app.launch()
        
        let likeButton = app.buttons["Like"]
        XCTAssertTrue(likeButton.waitForExistence(timeout: 5))
        likeButton.tap()
        
        XCTAssertTrue(app.staticTexts["Likes"].exists)
    }
    
    func testSaveLikedMovie() throws {
        let app = XCUIApplication()
        app.launch()
        
        let likeButton = app.buttons["Like"]
        XCTAssertTrue(likeButton.waitForExistence(timeout: 5))
        likeButton.tap()
    }
}
