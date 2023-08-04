///**

/**

PhotosFlickerDemo

Created by: apple on 8/4/23

Copyright (c) 2023 Rowaad


**/


import Foundation

// MARK: - ...  Presenter
class MoviesViewModel: BaseViewModel, MoviesViewModelProtocol {
    
    // Common varablies
    var moviesList = Bindable<[MoviesModel.Photo]>([])
    var displayMessage = Bindable<String?>(nil)

    //Paging varablies
    public private(set) var hasNext: Bool = false
    public var page: Int = 1
    
    //Section that will be avalible in collection cell
    public var sections = SectionContainer(handlers: [BannerSectionHandler(),
                                                     MovieSectionHandler()])
    
    // Interactor that load movies from apis
    private var moviesInteractor: MoviesInteractorProtocol
    
    init(moviesInteractor: MoviesInteractorProtocol) {
        self.moviesInteractor = moviesInteractor
    }
}
// MARK: - ...  Presenter Contract
extension MoviesViewModel {
    
    func didLoad() {
        self.isLoading.value = true
        moviesInteractor.didLoadMovies(page: page, completion: { moviesModel, error in
            self.isLoading.value = false
            
            if let error = error {
                self.displayMessage.value = error
                return
            }
            guard let data = moviesModel,
                  let records = data.photos?.photo else {
                return
            }
            
            //self.moviesList.value += records
            self.handleData(records: records)
            self.page += 1
            self.hasNext = self.page <= (moviesModel?.photos?.pages ?? 0) ? true : false
        })
    }
    
    func handleData(records: [MoviesModel.Photo]){
        let record: MoviesModel.Photo = MoviesModel.Photo(type: .banner)
        let tempRecords = records.adding(record, afterEvery: 5)
        self.moviesList.value += tempRecords
    }
    
    func getCount() -> Int {
        return moviesList.value.count
    }
    
    func fetchRecordFor(_ index: Int) -> MoviesModel.Photo? {
        return moviesList.value[safe: index]
    }
    
    func getMovieTypeFor(_ index: Int) -> PhotoType{
        return moviesList.value[safe: index]?.type ?? .movie
    }
}



