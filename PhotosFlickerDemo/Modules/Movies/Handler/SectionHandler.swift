//
//  FlickerDemo
//
//  Created by apple on 8/4/23.
//  Copyright © 2023 Mahmoud.Heshmat. All rights reserved.
//


import Foundation
import UIKit

// MARK: - Protocol that handle Tableview/Collectionview type cells
protocol SectionHandler {
    var type: String { get }
    func collectionView<T>(type: PhotoType,
                      _ cellModel: T,
                      _ collectionView: UICollectionView,
                      cellForRowAt indexPath: IndexPath) -> UICollectionViewCell
    
    func collectionViewSize(type: PhotoType,
                      _ collectionView: UICollectionView,
                      cellForRowAt indexPath: IndexPath) -> CGSize
}
