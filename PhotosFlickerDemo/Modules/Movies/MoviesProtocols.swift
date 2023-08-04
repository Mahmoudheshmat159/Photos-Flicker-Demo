///**

/**

PhotosFlickerDemo

Created by: apple on 8/4/23

Copyright (c) 2023 Rowaad


**/


import Foundation

//MARK: ... Interactor protocols
protocol MoviesInteractorProtocol {
    /// Func that return movies list via protocol
    func didLoadMovies(page: Int, completion: @escaping (MoviesModel?, String?) -> Void)
}


//MARK: ... ViewModel protocolos
protocol MoviesViewModelProtocol {
    func didLoad()
    func getCount() -> Int
    func fetchRecordFor(_ index: Int) -> MoviesModel.Photo?
}
