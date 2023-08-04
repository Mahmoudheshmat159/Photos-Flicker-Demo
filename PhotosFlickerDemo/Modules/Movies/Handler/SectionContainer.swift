///**

/**

PhotosFlickerDemo

Created by: apple on 8/4/23

Copyright (c) 2023 Rowaad


**/


import Foundation
import UIKit

// MARK: - Contanis all avaible cell and set to array
class SectionContainer {
    var sectionHandlers: [String: SectionHandler] = [:]
    init(handlers: [SectionHandler]){
        handlers.forEach { handler in
            sectionHandlers[handler.type] = handler
        }
    }
    
    func collectionView<T>(type: PhotoType,
                      _ cellModel: T,
                      _ collectionView: UICollectionView,
                      cellForRowAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionHandler = sectionHandlers[type.rawValue] else { return UICollectionViewCell() }
        return sectionHandler.collectionView(type: type, cellModel, collectionView, cellForRowAt: indexPath)
    }
    
    func collectionViewSize(type: PhotoType,
                      _ collectionView: UICollectionView,
                      cellForRowAt indexPath: IndexPath) -> CGSize {
        guard let sectionHandler = sectionHandlers[type.rawValue] else { return .zero }
        return sectionHandler.collectionViewSize(type: type, collectionView, cellForRowAt: indexPath)
    }
}
