//
//  HomeScreen.swift
//  TheMoviewDBUITests
//
//  Created by Camilo Betancourt on 12/03/22.
//

import XCTest

class HomeScreen: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testSearch() throws {
        let app = XCUIApplication()
        app.launch()
        
        let searchfield = app.searchFields["Search for a movie, tv show, person......"]
        let movieBatman = app.staticTexts["The Batman"]
        XCTAssertTrue(searchfield.waitForExistence(timeout: 5))
        XCTAssertTrue(movieBatman.waitForExistence(timeout: 5))
        searchfield.tap()
        searchfield.typeText("Spider")
        
        XCTAssertFalse(movieBatman.exists)
    }
    
    
    func testSearchMovie() throws {
        let app = XCUIApplication()
        app.launch()
        
        let searchfield = app.searchFields["Search for a movie, tv show, person......"]
        let movieNoExit = app.staticTexts["No Exit"]
        XCTAssertTrue(searchfield.waitForExistence(timeout: 5))
        XCTAssertTrue(movieNoExit.waitForExistence(timeout: 5))
        searchfield.tap()
        searchfield.typeText("Exit")
        
        XCTAssertTrue(movieNoExit.exists)
    }
    
    func testGoDetail() throws {
        let app = XCUIApplication()
        app.launch()
        
        let movieButton = app.buttons["414906"]
        XCTAssertTrue(movieButton.waitForExistence(timeout: 5))
        movieButton.tap()
        
        XCTAssertTrue(app.staticTexts["Overview"].exists)
    }

}
