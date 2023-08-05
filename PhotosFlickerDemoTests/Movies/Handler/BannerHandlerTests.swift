///**

/**

PhotosFlickerDemoTests

Created by: apple on 8/5/23

Copyright (c) 2023 Rowaad


**/


import XCTest
@testable import PhotosFlickerDemo

final class BannerHandlerTests: XCTestCase {
    
    var sut: BannerSectionHandler!
    var photoType: PhotoType!
    var collectioView: UICollectionView!
    var indexPath: IndexPath!

    override func setUp() {
        sut = BannerSectionHandler()
        photoType = .banner
        collectioView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        indexPath = IndexPath(row: 0, section: 0)
    }

    override func tearDown() {
        sut = nil
    }
    
    // MARK: Check Type
    func testBannerSectionHandler_WhenValidTypeProvided_ShouldReturnTrue() {
        
        // Act
        let type = sut.type
        
        // Assert
        XCTAssertEqual(type, PhotoType.banner.rawValue, "The type of banner should by Banner but it return movie")
    }

    // MARK: Check Type
    func testBannerSectionHandler_WhenInValidTypeProvided_ShouldReturnFalse() {
        
        // Act
        let type = sut.type
        
        // Assert
        XCTAssertNotEqual(type, PhotoType.movie.rawValue, "The type of banner shouldn't return banner it should return movie")
    }
    
    // MARK: Get CGSIZE
    func testBannerSectionHandler_WhenGetSizeOfCell_ShouldReturnTrueSize() {
        
        // Act
        let size = sut.collectionViewSize(type: photoType,
                                          collectioView,
                                          cellForRowAt: indexPath)
        
        // Assert
        XCTAssertEqual(size.width, collectioView.width, "The size of banner should return the same width of collection")
        XCTAssertEqual(size.height, 450, "The size of banner should return height of cell")
    }
    
    // MARK: Get CGSIZE
    func testBannerSectionHandler_WhenGetSizeOfCell_ShouldReturnFalseSize() {
        
        // Act
        let size = sut.collectionViewSize(type: photoType,
                                          collectioView,
                                          cellForRowAt: indexPath)
        
        // Assert
        XCTAssertNotEqual(size.width, collectioView.width - 20, "The size of banner should return the same width of collection")
        XCTAssertNotEqual(size.height, collectioView.height, "The size of banner should return height of cell")
    }
    
}
