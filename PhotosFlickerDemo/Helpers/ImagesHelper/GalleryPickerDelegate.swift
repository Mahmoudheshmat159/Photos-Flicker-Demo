//
//  GalleryPickerDelegate.swift
//  EffaiOS
//
//  Created by apple on 3/29/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit
import CoreData

internal typealias VideoPickerDelegate = UIImagePickerControllerDelegate & UINavigationControllerDelegate

internal enum PickingType {
    case picture, video
}

protocol GalleryPickerDelegate: AnyObject {
    func galleryPicker(_ galleryPicker: GalleryPickerHelper?, forImage: UIImage)
    func galleryPicker(_ galleryPicker: GalleryPickerHelper?, forURL: URL?)
}

extension GalleryPickerDelegate {
    func galleryPicker(_ galleryPicker: GalleryPickerHelper?, forImage: UIImage) { }
    func galleryPicker(_ galleryPicker: GalleryPickerHelper?, forURL: URL?) { }
}

