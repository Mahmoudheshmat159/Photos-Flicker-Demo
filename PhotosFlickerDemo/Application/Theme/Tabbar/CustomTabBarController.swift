//
//  CustomTabBarController.swift
//  EffaiOS
//
//  Created by apple on 3/24/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit

var selectedTabIndex: Int = 2

class CustomTabBarController: UITabBarController {
    var customTabBar: CustomTabBarView!
    var tabBarHeight: CGFloat = UIScreen.main.bounds.width > 375 ?  120 : 80
    var bottomConstraint: CGFloat = UIScreen.main.bounds.width > 375 ? 114 : 80
    var topConstraint: CGFloat = UIScreen.main.bounds.width > 375 ? 75 : 35

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = 2
        loadTabBar()
        print("annnan  \(UIScreen.main.bounds.width)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    func loadTabBar() {
        tabBar.isHidden = true
        self.customTabBar = CustomTabBarView(frame: CGRect(x: 0, y: 0, width: tabBar.width, height: tabBarHeight))
        //print("aamamam \(self.customTabBar.shopBottomConstraintLayout.constant)    \(self.customTabBar.topShopConstraintLayout.constant)")
        self.customTabBar.shopBottomConstraintLayout.constant = bottomConstraint
        //self.customTabBar.topShopConstraintLayout.constant = topConstraint
        self.customTabBar.translatesAutoresizingMaskIntoConstraints = false
        self.customTabBar.clipsToBounds = false
        self.customTabBar.tabBar = tabBar
        self.customTabBar.onDidClickItem = { [weak self] index in
            self?.selectedIndex = index
        }
        self.view.addSubview(customTabBar)
        NSLayoutConstraint.activate([
            self.customTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            self.customTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            self.customTabBar.widthAnchor.constraint(equalToConstant: view.width),
            self.customTabBar.heightAnchor.constraint(equalToConstant: tabBarHeight), // Fixed height for nav menu
            self.customTabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor)
        ])
        self.view.layoutIfNeeded() // important step
    }
    
    func hideTabBar() {
        //self.hidesBottomBarWhenPushed = true
        self.customTabBar.isHidden = true
    }
    
    func showTabBar() {
        self.customTabBar.isHidden = false
    }
}


