//
//  BindDisposable.swift
//  BaseIOS
//
//  Created by Mohamed Abdu on 23/03/2022.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation

public class BindDisposable {
    
    private let onDispose: (() -> Void)
    
    init(onDispose: @escaping () -> Void) {
        self.onDispose = onDispose
    }
    
    public func dispose() {
        onDispose()
    }
    
    deinit {
        dispose()
    }
}
