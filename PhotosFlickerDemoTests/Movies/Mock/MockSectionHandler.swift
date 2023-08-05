//
//  FlickerDemo
//
//  Created by apple on 8/4/23.
//  Copyright © 2023 Mahmoud.Heshmat. All rights reserved.
//


import Foundation
import UIKit
@testable import PhotosFlickerDemo

class MockSectionHandler: SectionHandler {
    var type: String = ""
    
    func collectionView<T>(type: PhotosFlickerDemo.PhotoType, _ cellModel: T, _ collectionView: UICollectionView, cellForRowAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionViewSize(type: PhotosFlickerDemo.PhotoType, _ collectionView: UICollectionView, cellForRowAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 400)
    }
    
}
