//
//  DisposeBag.swift
//  BaseIOS
//
//  Created by Mohamed Abdu on 23/03/2022.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation

protocol Observable: NSObjectProtocol {
    var disposeBag: DisposableBag { get set }
    func bind()
}

public struct DisposableBag {
    
    private var disposables: [BindDisposable] = []
    
    public init() {
        
    }
    public mutating func add(_ disposable: BindDisposable?) {
        
        guard let disposable = disposable else {
            return
        }
        disposables.append(disposable)
    }
}
