//
//  UICollectionViewProtocol.swift
//
//  Created by Mohamed Abdu on 6/21.
//

import Foundation
import UIKit

// MARK: - ...  Cell Error
public enum CellError: Error {
    case confirmProtocol
}
// MARK: - ...  Cell Protocol Must all cells implement this protocol
public protocol CellProtocol {
    func setup()
}
