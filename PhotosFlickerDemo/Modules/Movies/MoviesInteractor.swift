///**

/**

PhotosFlickerDemo

Created by: apple on 8/4/23

Copyright (c) 2023 Rowaad


**/


import Foundation

class MoviesInteractor: MoviesInteractorProtocol {
    
    
    func didLoadMovies(page: Int, completion: @escaping (MoviesModel?, String?) -> Void) {
        
        var parameters : [String : Any] = [:]
        parameters["page"] = page
        
        parameters["method"] = APIParamConstantHelper.shared.method
        parameters["format"] = APIParamConstantHelper.shared.format
        parameters["text"] = APIParamConstantHelper.shared.text
        parameters["per_page"] = APIParamConstantHelper.shared.perPage
        parameters["nojsoncallback"] = APIParamConstantHelper.shared.nojsoncallback
        parameters["api_key"] = APIParamConstantHelper.shared.api_key
        
        NetworkManager.instance.paramaters = parameters
        NetworkManager.instance.request(.rest, type: .get, MoviesModel.self) { response in
           
            switch response {
            case .success(let model):
                
                guard let data = model else {
                    completion(nil, Messages.DecodeError)
                    return
                }
                completion(data, nil)
                
            case .failure(let error):
                completion(nil, error?.localizedDescription ?? "")
            }
        }
    }
}
