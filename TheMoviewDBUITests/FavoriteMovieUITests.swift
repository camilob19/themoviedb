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
}
