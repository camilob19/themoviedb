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
        
        // Hacer click en el id 414906
        let movieButton = app.buttons["414906"]
        XCTAssertTrue(movieButton.waitForExistence(timeout: 5))
        movieButton.tap()
        
        // Verificar que si estemos en la vista de detalle
        XCTAssertTrue(app.staticTexts["Overview"].exists)
        
        //darle tap a boton de like por primera vez
        let likedButton = app.buttons["likeButton"]
        XCTAssertTrue(likedButton.exists)
        likedButton.tap()
        
        //volver atras
        let backbutton = app.buttons["What's Popular"]
        XCTAssertTrue(backbutton.exists)
        backbutton.tap()
        
        // Dar tap en el tab de Like
        let likeTabButton = app.buttons["Like"]
        XCTAssertTrue(likeTabButton.waitForExistence(timeout: 5))
        likeTabButton.tap()
        
        // Verificar que exista el texto y el boton de la pelicula seleccionada
        XCTAssertTrue(app.staticTexts["Likes"].exists)
        XCTAssertTrue(movieButton.exists)
        
        // Volver al home de popular
        let popularTabButton = app.buttons["Popular"]
        XCTAssertTrue(popularTabButton.waitForExistence(timeout: 5))
        popularTabButton.tap()
        
        // Esperar que exista la pelicula y darle tap a la pelicula
        XCTAssertTrue(movieButton.waitForExistence(timeout: 5))
        movieButton.tap()
        
        // Verificamos que si estemos en el detalle
        XCTAssertTrue(app.staticTexts["Overview"].exists)
        
        // darle like para que se deseleccione
        XCTAssertTrue(likedButton.exists)
        likedButton.tap()
        
        //volver atras
        XCTAssertTrue(backbutton.exists)
        backbutton.tap()
        
        // Dar tap en el tab de Like
        XCTAssertTrue(likeTabButton.waitForExistence(timeout: 5))
        likeTabButton.tap()
        
        // Verificar que exista el texto y el boton de la pelicula seleccionada
        XCTAssertTrue(app.staticTexts["Likes"].exists)
        XCTAssertFalse(movieButton.exists)
        
        
    }
}
