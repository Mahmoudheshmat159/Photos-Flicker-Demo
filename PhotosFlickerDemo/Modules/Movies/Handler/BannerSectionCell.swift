///**

/**

PhotosFlickerDemo

Created by: apple on 8/4/23

Copyright (c) 2023 Rowaad


**/


import Foundation
import UIKit

class BannerSectionHandler: SectionHandler {
    
    var type: String {
        return PhotoType.banner.rawValue
    }
    
    func collectionView<T>(type: PhotoType, _ cellModel: T, _ collectionView: UICollectionView, cellForRowAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withClass: BannerCell.self, for: indexPath)
        if let record = cellModel as? MoviesModel.Photo{
            cell.bind(record)
        }
        return cell
    }
    
    func collectionViewSize(type: PhotoType, _ collectionView: UICollectionView, cellForRowAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 450)
    }
    
}
