//
//  BaseViewControllerProtocol.swift
//
//  Created by Mahmoud Heshmat on 5/21.
//

import Foundation
import UIKit

// MARK: - ...  Base Controller must be implement this protocol
protocol BaseViewControllerProtocol {
    func setup()
    func setupBase()
    func controller<T>(_ indetifier: T.Type, storyboard: UIStoryboard ) -> T
    func initViewController(_ indetifier: String, storyboard: UIStoryboard ) -> UIViewController
    func initNavigationController (_ indetifier: String, storyboard: UIStoryboard ) -> UINavigationController
    func push(_ view: UIViewController, _ animated: Bool)
}
extension BaseViewControllerProtocol where Self: BaseController {
    func setup() {

    }
    func initViewController(_ indetifier: String, storyboard: UIStoryboard = Coordinator.instance.storyboard) -> UIViewController {

        //let storyboard: UIStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let scene: UIViewController = storyboard.instantiateViewController(withIdentifier: indetifier)
        return scene
    }
    func initNavigationController(_ indetifier: String, storyboard: UIStoryboard = Coordinator.instance.storyboard) -> UINavigationController {

        //let storyboard: UIStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        guard let scene: UINavigationController = storyboard.instantiateViewController(withIdentifier: indetifier)
            as? UINavigationController else { return UINavigationController() }
        return scene
    }
    func controller<T>(_ indetifier: T.Type, storyboard: UIStoryboard = Coordinator.instance.storyboard) -> T {

        //let storyboard: UIStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let scene: UIViewController = storyboard.instantiateViewController(withIdentifier: String(describing: indetifier))
        if let controller = scene as? T {
            return controller
        } else {
            fatalError("Controller failed while casting")
        }
    }
    func push(_ view: UIViewController, _ animated: Bool = true) {
        self.navigationController?.pushViewController(view, animated: animated)
    }
}
