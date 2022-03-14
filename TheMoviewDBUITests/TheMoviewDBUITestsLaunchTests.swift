//
//  TheMoviewDBUITestsLaunchTests.swift
//  TheMoviewDBUITests
//
//  Created by Camilo Betancourt on 9/03/22.
//

import XCTest

class TheMoviewDBUITestsLaunchTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }
}
