//
//  Header.swift
//  EffaiOS
//
//  Created by apple on 3/27/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation

import UIKit

class HeaderView: UIView {
    
    @IBOutlet weak var menuBtnButton: UIButton!
    @IBOutlet weak var mainView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
        setupUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadViewFromNib()
        setupUI()
    }
    
    private func setupUI(){
        if menuBtnButton != nil {
            guard let topViewcontroller = UIApplication.topViewController() else {
                return
            }
            MenuHelper.instance.setUpMenuButton(delegate: topViewcontroller, menuBtn: menuBtnButton)
        }
    }
    
    func loadViewFromNib() {
        let name = String(describing: type(of: self))
        let nib = UINib(nibName: name, bundle: .main)
        nib.instantiate(withOwner: self, options: nil)
        
        // next: append the container to our view
        self.addSubview(self.mainView)
        self.mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.mainView.topAnchor.constraint(equalTo: self.topAnchor),
            self.mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
    }
    
    static func customAlert() -> HeaderView {
        return Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)!.first as! HeaderView
    }
    
    @IBAction func fourmAction(_ sender: UIButton) {
      
    }
}
