//
//  NoonWebView.swift
//  FlickerDemo
//
//  Created by apple on 4/19/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import UIKit
import Foundation
import WebKit

class NoonWebView: BaseController {
    @IBOutlet weak var webView: WKWebView!
    
    var url: URL?
    weak var delegate: NoonDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        webView.navigationDelegate = self
        webView.uiDelegate = self
        webView.load(URLRequest(url: url!))
    }
}

extension NoonWebView: WKNavigationDelegate {
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Swift.Void) {
        if(navigationAction.navigationType == .other) {
            if navigationAction.request.url != nil {
                guard let url = navigationAction.request.url?.absoluteString else {
                    decisionHandler(.allow)
                    return
                }
                if url.contains("success-payment") {
                    self.dismiss(animated: true, completion: nil)
                    self.delegate?.noon(nil, success: true)
                } else if url.contains("failed-payment") {
                    self.dismiss(animated: true, completion: nil)
                    self.delegate?.noon(nil, fail: true)
                }
                decisionHandler(.allow)
                return
            }
            decisionHandler(.allow)
            return
        } else {
            decisionHandler(.allow)
            return
        }
    }
}

extension NoonWebView: WKUIDelegate {
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: Messages.done, style: .default, handler: { action in
            completionHandler(true)
        }))
        alertController.addAction(UIAlertAction(title: Messages.cancel, style: .default, handler: { action in
            completionHandler(false)
        }))
        present(alertController, animated: true, completion: nil)
    }
}


