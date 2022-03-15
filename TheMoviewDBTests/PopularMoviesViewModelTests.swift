//
//  PopularMoviesViewModelTests.swift
//  TheMoviewDBTests
//
//  Created by Camilo Betancourt on 12/03/22.
//

import XCTest
import Combine
@testable import TheMovieDB

// se debe llenar movies del servicio
// se debe filtrar filteredMovies cuando searchText cambie

class PopularMoviesViewModelTests: XCTestCase {

    @MainActor func test_loadService_successfull() {
        let SUT = makeSUT()
        
        SUT.loadMovies()
        
        XCTAssertEqual(SUT.movies.results.count, 2)
    }
    
    @MainActor func test_filterMovies_successfull() {
        let SUT = makeSUT()
        SUT.loadMovies()
        
        SUT.searchText = "1"
        
        XCTAssertEqual(SUT.filteredMovies.results.count, 1)
    }
    
    @MainActor func makeSUT() -> PopularMoviesViewModel {
        return PopularMoviesViewModel(repository: FakeRepository())
    }
}

private class FakeRepository: PopularMoviesRepositoryProtocol {
    
    var fakeMovies: Movies {
        var movies = Movies()
        movies.page = 1
        movies.results = [
            Movie(adult: true,
                  backdropPath: "/5P8SmMzSNYikXpxil6BYzJ16611.jpg",
                  genreIDS: [1,2,3],
                  id: 414906,
                  originalLanguage: .en,
                  originalTitle: "The Batman 1",
                  overview: "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer",
                  popularity: 4.0,
                  posterPath: "/74xTEgt7R36Fpooo50r9T25onhq.jpg",
                  releaseDate: "2022-03-01",
                  title: "The Batman 1",
                  video: true,
                  voteAverage: 5.5,
                  voteCount: 1000),
            Movie(adult: true,
                  backdropPath: "/5P8SmMzSNYikXpxil6BYzJ16611.jpg",
                  genreIDS: [1,2,3],
                  id: 414907,
                  originalLanguage: .en,
                  originalTitle: "The PP 2",
                  overview: "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer",
                  popularity: 4.0,
                  posterPath: "/74xTEgt7R36Fpooo50r9T25onhq.jpg",
                  releaseDate: "2022-03-01",
                  title: "The THH 2",
                  video: true,
                  voteAverage: 5.5,
                  voteCount: 1000)
        
        ]
        
        return movies
    }
    
    func getMovies() -> AnyPublisher<Movies, Never> {
        return Just(fakeMovies).eraseToAnyPublisher()
    }
}
