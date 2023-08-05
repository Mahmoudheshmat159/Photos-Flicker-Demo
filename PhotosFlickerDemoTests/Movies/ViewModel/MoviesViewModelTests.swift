///**

/**

PhotosFlickerDemoTests

Created by: apple on 8/5/23

Copyright (c) 2023 Rowaad


**/


import XCTest
@testable import PhotosFlickerDemo

final class MoviesViewModelTests: XCTestCase {
    
    var sut: MoviesViewModel!
    var interactor: MockMoviesInteractor!
    var page: Int!
    
    

    override func setUp() {
        interactor = MockMoviesInteractor()
        sut = MoviesViewModel(moviesInteractor: interactor)
        page = 1
    }

    override func tearDown() {
        sut = nil
        page = nil
    }
    
    // MARK: Check CGSIZE
    
    
    func testMoviesInteractor_SuccessResponse_ShouldReturnTrue(){
        //Arrange
        let expectation = self.expectation(description: "MoviesViewModel Tests")
        interactor.expectation = expectation
        interactor.mockSuccess = true
        
        //Act
        sut.didLoad()
        self.wait(for: [expectation], timeout: 5)
        
        
        //Assert
        XCTAssertTrue(interactor.isFetchDataSuccess)
    }
    
    func testMoviesInteractor_ErrorResponse_ShouldReturnFalse(){
        //Arrange
        let expectation = self.expectation(description: "MoviesViewModel Tests")
        interactor.expectation = expectation
        interactor.mockSuccess = false
        
        //Act
        sut.didLoad()
        self.wait(for: [expectation], timeout: 5)
        
        
        //Assert
        XCTAssertFalse(interactor.isFetchDataSuccess)
    }
}
