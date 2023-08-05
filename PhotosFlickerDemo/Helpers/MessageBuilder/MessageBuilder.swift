//
//  NotificationBuilder.swift
//  FlickerDemo
//
//  Created by apple on 3/23/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit
import SwiftMessages

class MessageBuilder {
    var title: String? = nil,
        body: String? = nil,
        theme: Theme = .error,
        duration: SwiftMessages.Duration = .automatic,
        notifyStyle: SwiftMessages.PresentationStyle = .top,
        dimMode: SwiftMessages.DimMode? = nil,
        displayButton: Bool = false,
        agreeHandler: (() -> Void)? = nil
    
    init() {
        
    }
    func setTitle(_ title: String?) -> Self {
        self.title = title
        return self
    }
    func setBody(_ body: String?) -> Self {
        self.body = body
        return self
    }
    func setTheme(_ theme: Theme) -> Self {
        self.theme = theme
        return self
    }
    func setStyle(_ style: SwiftMessages.PresentationStyle) -> Self {
        self.notifyStyle = style
        return self
    }
    func setDuration(_ duration: SwiftMessages.Duration) -> Self {
        self.duration = duration
        return self
    }
    func setDimMode(_ dimMode: SwiftMessages.DimMode) -> Self {
        self.dimMode = dimMode
        return self
    }
    func setButton(_ button: Bool) -> Self {
        self.displayButton = button
        return self
    }
    func setAgreeHandler(_ handler: (() -> Void)?) -> Self {
        self.agreeHandler = handler
        return self
    }
    @discardableResult
    func bulid() -> Self {
        let view = MessageView.viewFromNib(layout: .cardView)
        var config = SwiftMessages.Config()
        view.configureTheme(theme)
        view.bodyLabel?.font = R.font.almaraiBold(size: 15)
        view.configureDropShadow()
        view.configureContent(title: title, body: body, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: nil, buttonTapHandler: nil)
        //view.configureContent(title: title ?? "", body: body ?? "")
        config.duration = duration
        config.interactiveHide = true
        SwiftMessages.show(config: config, view: view)
        return self
    }
}
