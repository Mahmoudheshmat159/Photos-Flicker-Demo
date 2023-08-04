//
//  BarView.swift
//  EffaiOS
//
//  Created by apple on 3/24/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit

class BarView: NibLoadingView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var barImageView: UIImageView!
    @IBOutlet weak var barLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //setupUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //setupUI()
    }
}
