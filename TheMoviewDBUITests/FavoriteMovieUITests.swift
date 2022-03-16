//
//  FavoriteMovieUITests.swift
//  TheMoviewDBUITests
//
//  Created by Camilo Betancourt on 15/03/22.
//

import XCTest

class FavoriteMovieUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testGoFavorite() throws {
        let app = XCUIApplication()
        app.launch()
        
        let favoritesButton = app.buttons["Favorites"]
        XCTAssertTrue(favoritesButton.waitForExistence(timeout: 5))
        favoritesButton.tap()
        
        XCTAssertTrue(app.staticTexts["Favorites"].exists)
    }
    
    func testSaveFavorite() throws {
        let app = XCUIApplication()
        app.launch()
        
        let movieButton = app.buttons["414906"]
        XCTAssertTrue(movieButton.waitForExistence(timeout: 5))
        movieButton.tap()
        
        XCTAssertTrue(app.staticTexts["Overview"].exists)
        
        let favoritesButton = app.buttons["Favorite"]
        XCTAssertTrue(favoritesButton.exists)
        favoritesButton.tap()
        
        let backbutton = app.buttons["What's Popular"]
        XCTAssertTrue(backbutton.exists)
        backbutton.tap()
        
        let favoritesTabButton = app.buttons["Favorites"]
        XCTAssertTrue(favoritesTabButton.waitForExistence(timeout: 5))
        favoritesTabButton.tap()
        
        XCTAssertTrue(app.staticTexts["Favorites"].exists)
        XCTAssertTrue(movieButton.exists)
        
        let popularTabButton = app.buttons["Popular"]
        XCTAssertTrue(popularTabButton.waitForExistence(timeout: 5))
        popularTabButton.tap()
        
        XCTAssertTrue(movieButton.waitForExistence(timeout: 5))
        movieButton.tap()
        
        XCTAssertTrue(app.staticTexts["Overview"].exists)
        
        XCTAssertTrue(favoritesButton.exists)
        favoritesButton.tap()
        
        XCTAssertTrue(backbutton.exists)
        backbutton.tap()
        
        XCTAssertTrue(favoritesTabButton.waitForExistence(timeout: 5))
        favoritesTabButton.tap()
        
        XCTAssertTrue(app.staticTexts["Favorites"].exists)
        XCTAssertFalse(movieButton.exists)
    }
}
