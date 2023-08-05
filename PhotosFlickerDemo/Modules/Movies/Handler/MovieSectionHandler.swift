//
//  FlickerDemo
//
//  Created by apple on 8/4/23.
//  Copyright © 2023 Mahmoud.Heshmat. All rights reserved.
//


import Foundation
import UIKit

class MovieSectionHandler: SectionHandler {
    
    var type: String {
        return PhotoType.movie.rawValue
    }
    
    func collectionView<T>(type: PhotoType, _ cellModel: T, _ collectionView: UICollectionView, cellForRowAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withClass: MovieCell.self, for: indexPath)
        if let record = cellModel as? MoviesModel.Photo{
            cell.bind(record)
        }
        return cell
    }
    
    func collectionViewSize(type: PhotoType, _ collectionView: UICollectionView, cellForRowAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 240)
    }
}
