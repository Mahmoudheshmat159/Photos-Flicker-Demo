//
//  FlickerDemo
//
//  Created by apple on 8/4/23.
//  Copyright © 2023 Mahmoud.Heshmat. All rights reserved.
//


import Foundation
import XCTest
@testable import PhotosFlickerDemo

class MockMoviesInteractor: MoviesInteractorProtocol {
  
    var mockSuccess: Bool = true
    var expectation: XCTestExpectation?
    var isFetchDataSuccess: Bool = false
    
    func didLoadMovies(page: Int, completion: @escaping (PhotosFlickerDemo.MoviesModel?, String?) -> Void) {
        if mockSuccess {
//            let userModel = UserModel(data: UserModel.DataClass(authorization: nil, record: nil, errors: nil))
//            completion(true, userModel,nil)
            isFetchDataSuccess = true
            self.expectation?.fulfill()
        }else{
            completion(nil, NetworkError(message: "Failed to load data").localizedDescription)
            isFetchDataSuccess = false
            self.expectation?.fulfill()
        }
       
    }
}
