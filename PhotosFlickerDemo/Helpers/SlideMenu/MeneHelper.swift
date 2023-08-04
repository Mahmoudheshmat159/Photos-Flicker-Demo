//
//  MeneHelper.swift
//  EffaiOS
//
//  Created by apple on 3/27/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import UIKit

class MenuHelper {
    struct Static {
        static var instance: MenuHelper?
    }

    class var instance: MenuHelper {

        if Static.instance == nil {
            Static.instance = MenuHelper()
        }

        return Static.instance!
    }

    private weak var delegate: UIViewController?
    private let storyboard = UIStoryboard(name: "MenuStoryboard", bundle: nil)
    private let navID =  "MenuNavigationController"
    private var menuWidth: CGFloat = {
        let appScreenRect = UIApplication.keyWindow?.bounds ?? UIWindow().bounds
        let minimumSize = min(appScreenRect.width * 0.85, appScreenRect.height)
        return max(round(minimumSize), 240)
    }()

    private func setupMenu() {
        if getAppLang() == .arabic {
            SideMenuManager.default.menuRightNavigationController = storyboard.instantiateViewController(withIdentifier: navID)
                as? UISideMenuNavigationController
        } else {
            SideMenuManager.default.menuLeftNavigationController = storyboard.instantiateViewController(withIdentifier: navID)
                as? UISideMenuNavigationController
        }
        SideMenuManager.default.menuAddPanGestureToPresent(toView: delegate?.navigationController?.navigationBar ?? UIView())
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: delegate?.view ?? UIView())
        SideMenuManager.default.menuWidth = menuWidth
        SideMenuManager.default.menuPresentMode = .menuSlideIn//.viewSlideInOut
        SideMenuManager.default.menuBlurEffectStyle = .none
        SideMenuManager.default.menuFadeStatusBar = false
    }

    func setUpMenuButton(delegate: UIViewController, menuBtn: UIBarButtonItem) {
        self.delegate = delegate
        // Define the menus
        setupMenu()
        menuBtn.target = self
        menuBtn.action = #selector(toggoleMenu)

    }
    func setUpMenuButton(delegate: UIViewController, menuBtn: UIButton) {
        self.delegate = delegate
        // Define the menus
        setupMenu()
        menuBtn.addTarget(self, action: #selector(MenuHelper.toggoleMenu), for: .touchUpInside)
    }

    @objc func toggoleMenu() {
//
        var menu: UIViewController!
        if getAppLang() == .arabic {
            menu = SideMenuManager.default.menuRightNavigationController
        } else {
            menu = SideMenuManager.default.menuLeftNavigationController
        }
        if let visibleViewController = SideMenuTransition.visibleViewController {
            visibleViewController.present(menu, animated: true, completion: nil)
        }
    }

}

