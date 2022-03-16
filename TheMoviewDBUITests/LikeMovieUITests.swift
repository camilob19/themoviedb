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
        
        let movieButton = app.buttons["414906"]
        XCTAssertTrue(movieButton.waitForExistence(timeout: 5))
        movieButton.tap()
        
        XCTAssertTrue(app.staticTexts["Overview"].exists)
        
        let likedButton = app.buttons["likeButton"]
        XCTAssertTrue(likedButton.exists)
        likedButton.tap()
        
        let backbutton = app.buttons["What's Popular"]
        XCTAssertTrue(backbutton.exists)
        backbutton.tap()
        
        // Dar tap en el tab de Like
        let likeTabButton = app.buttons["Like"]
        XCTAssertTrue(likeTabButton.waitForExistence(timeout: 5))
        likeTabButton.tap()
        
        XCTAssertTrue(app.staticTexts["Likes"].exists)
        XCTAssertTrue(movieButton.exists)
        
        let popularTabButton = app.buttons["Popular"]
        XCTAssertTrue(popularTabButton.waitForExistence(timeout: 5))
        popularTabButton.tap()
        
        XCTAssertTrue(movieButton.waitForExistence(timeout: 5))
        movieButton.tap()
        
        XCTAssertTrue(app.staticTexts["Overview"].exists)
        
        XCTAssertTrue(likedButton.exists)
        likedButton.tap()
        
        XCTAssertTrue(backbutton.exists)
        backbutton.tap()
        
        XCTAssertTrue(likeTabButton.waitForExistence(timeout: 5))
        likeTabButton.tap()
        
        XCTAssertTrue(app.staticTexts["Likes"].exists)
        XCTAssertFalse(movieButton.exists)
    }
}
