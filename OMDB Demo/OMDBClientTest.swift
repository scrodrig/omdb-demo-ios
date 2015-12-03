//
//  OMDBClientTest.swift
//  OMDB Demo
//
//  Created by Schubert David Rodríguez on 03/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import XCTest

class OMDBClientTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testParseMethod() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let responseString = "{\"Search\":[{\"Title\":\"Happy Gilmore\",\"Year\":\"1996\",\"imdbID\":\"tt0116483\",\"Type\":\"movie\",\"Poster\":\"http://ia.media-imdb.com/images/M/MV5BMjA4NjUxODg3Ml5BMl5BanBnXkFtZTcwNzcyODc5Mw@@._V1_SX300.jpg\"},{\"Title\":\"Happy Feet\",\"Year\":\"2006\",\"imdbID\":\"tt0366548\",\"Type\":\"movie\",\"Poster\":\"http://ia.media-imdb.com/images/M/MV5BMTQyNTkxMjUwMV5BMl5BanBnXkFtZTcwMDQ2NTU0MQ@@._V1_SX300.jpg\"},{\"Title\":\"Happy-Go-Lucky\",\"Year\":\"2008\",\"imdbID\":\"tt1045670\",\"Type\":\"movie\",\"Poster\":\"http://ia.media-imdb.com/images/M/MV5BMTI4ODY1MjIyNV5BMl5BanBnXkFtZTcwMTExMTM5MQ@@._V1_SX300.jpg\"},{\"Title\":\"Happy Feet 2\",\"Year\":\"2011\",\"imdbID\":\"tt1402488\",\"Type\":\"movie\",\"Poster\":\"http://ia.media-imdb.com/images/M/MV5BMTg1MzU2Nzg2OV5BMl5BanBnXkFtZTcwNzE3MzAxNg@@._V1_SX300.jpg\"},{\"Title\":\"Happy Endings\",\"Year\":\"2011–2013\",\"imdbID\":\"tt1587678\",\"Type\":\"series\",\"Poster\":\"http://ia.media-imdb.com/images/M/MV5BMjE0NTQyOTM5OF5BMl5BanBnXkFtZTcwOTYyMTU2OA@@._V1_SX300.jpg\"},{\"Title\":\"Happy New Year\",\"Year\":\"2014\",\"imdbID\":\"tt2461132\",\"Type\":\"movie\",\"Poster\":\"http://ia.media-imdb.com/images/M/MV5BMjA5Njg4NjA1MV5BMl5BanBnXkFtZTgwOTMzOTk0MjE@._V1_SX300.jpg\"},{\"Title\":\"Happy Together\",\"Year\":\"1997\",\"imdbID\":\"tt0118845\",\"Type\":\"movie\",\"Poster\":\"http://ia.media-imdb.com/images/M/MV5BMTc4ODY4MjY2MF5BMl5BanBnXkFtZTcwNTE0MDMzNA@@._V1_SX300.jpg\"},{\"Title\":\"Happy Tree Friends\",\"Year\":\"1999–\",\"imdbID\":\"tt0770762\",\"Type\":\"series\",\"Poster\":\"http://ia.media-imdb.com/images/M/MV5BMjM4OTIxNzU0OV5BMl5BanBnXkFtZTgwNzcyNzkwMzE@._V1_SX300.jpg\"},{\"Title\":\"Happy Days\",\"Year\":\"1974–1984\",\"imdbID\":\"tt0070992\",\"Type\":\"series\",\"Poster\":\"http://ia.media-imdb.com/images/M/MV5BMjIxMjI2OTc2OF5BMl5BanBnXkFtZTcwNTUyMjM1Mw@@._V1_SX300.jpg\"},{\"Title\":\"Happy, Texas\",\"Year\":\"1999\",\"imdbID\":\"tt0162360\",\"Type\":\"movie\",\"Poster\":\"http://ia.media-imdb.com/images/M/MV5BMTg3MjE0ODkwOV5BMl5BanBnXkFtZTcwNjE4NzUxMQ@@._V1_SX300.jpg\"}]}";
        
        XCTAssertNil(OMDBClient.parseMovies(nil));
        
        let data = responseString.dataUsingEncoding(NSUTF8StringEncoding);
        
        let movies = OMDBClient.parseMovies(data);
        
        XCTAssertNotNil(movies);
        XCTAssertEqual(movies!.count, 10);
    }
    
    func testSearchMovieBy(){
        let query = "Happy";
        let expectation = expectationWithDescription("going to fetch movies")
        OMDBClient.searchMovieBy(query) { (movies, error) -> Void in
            XCTAssertNotNil(movies);
            XCTAssertNil(error);
            XCTAssertEqual(movies!.count, 10);
            expectation.fulfill();
        }
        
        waitForExpectationsWithTimeout(5) {(error) -> Void in
            XCTAssertNil(error);
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
