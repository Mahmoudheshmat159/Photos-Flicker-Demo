//
//  CustomTabBarView.swift
//  EffaiOS
//
//  Created by apple on 3/24/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit

typealias OnClickTabBarItem = ((Int) -> Void)

class CustomTabBarView: UIView {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var shopView: UIView!
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var shopImageView: UIImageView!
    @IBOutlet weak var shopBottomConstraintLayout: NSLayoutConstraint!
    @IBOutlet weak var topShopConstraintLayout: NSLayoutConstraint!
    
    
    var view: UIView!
    var tabBar: UITabBar? {
        didSet {
            setupTabBar()
        }
    }
    var selectedIndex: Int = selectedTabIndex
    var onDidClickItem: OnClickTabBarItem?

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibSetup()
    }
    func xibSetup() {
        view = loadNib()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = bounds
        addSubview(view)
        // add Constraints
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|", options: [], metrics: nil, views: ["childView": view!]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|", options: [], metrics: nil, views: ["childView": view!]))
    }
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    @IBAction func homeTap(_ sender: UIButton){
        print("asdasd tapped \(sender.tag)")
        self.selectedIndex = sender.tag
        self.setupTabBar()
        self.onDidClickItem?(sender.tag)
    }
}
extension CustomTabBarView {
    func setupTabBar() {
        self.stackView.removeSubviews()
        let items = tabBar?.items ?? []
        var counter = 0
        for item in items {
            stackView.addArrangedSubview(setupItemView(for: item, counter: counter))
            counter += 1
        }
    }
    func setupItemView(for item: UITabBarItem, counter: Int = 0) -> UIView {
        
        let view = BarView()
        view.barImageView.image = item.image
        view.barImageView.render(color: .lightGray)
        view.barLabel.text = item.title?.localized
        view.barLabel.font = R.font.almaraiRegular(size: 11)
        view.barLabel.textColor = .lightGray
        view.containerView.layer.cornerRadius = 10
        view.containerView.layer.borderWidth = 2
        view.containerView.layer.borderColor = UIColor.clear.cgColor
        shopImageView.render(color: .lightGray)
        
        
        print("inddex \(selectedIndex)   \(counter)")
        
        if counter == 2 {
            view.barImageView.isHidden = true
            shopImageView.image = item.selectedImage
        }else{
            view.barImageView.isHidden = false
        }
        
        if selectedIndex == counter {
            view.barLabel.font = R.font.almaraiBold(size: 11)
            view.barLabel.textColor = .black
            view.barImageView.image = item.selectedImage
            view.barImageView.render(color: .black)
        }
        
        let btn = UIButton()
        btn.tag = counter
        view.addSubview(btn)
        btn.fillSuperView()
        self.actionForItem(for: btn)
        
        //shopView.bringSubviewToFront(homeBtn)
        //homeBtn.bringSubviewToFront(view)
        
//        let button = UIButton()
//        button.frame = CGRect(x: self.shopView.frame.size.width, y: 0, width: 0, height: self.shopView.frame.size.height)
//        button.backgroundColor = UIColor.red
//        button.setTitle("Name", for: .normal)
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//        self.shopView.addSubview(button)
        
        
        return view
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
     }
    
    func actionForItem(for btn: UIButton) {
        btn.addTarget(self, action: #selector(tabBarItemClicked(_:)), for: .touchUpInside)
    }
    @objc func tabBarItemClicked(_ btn: UIButton) {
        self.selectedIndex = btn.tag
        self.setupTabBar()
        self.onDidClickItem?(btn.tag)
    }
}


