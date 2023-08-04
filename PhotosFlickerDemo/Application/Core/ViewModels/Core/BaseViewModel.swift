//
//  CoreViewModel.swift
//  SupportI
//
//  Created by Mahmoud Heshmat on 5/21.
//  Copyright © 2018 MahmoudHeshmat. All rights reserved.
//

import Foundation
import Alamofire
// MARK: - ...  Base ViewModel
class BaseViewModel: NSObject, ViewModelProtocol {
    var requests: [DataRequest?] = []
    
    var isLoading = Bindable<Bool>(false)
    
    // MARK: - ...  empty the refrence 
    deinit {
        removeTasks()
    }
    
    func startLoading(){
        DispatchQueue.main.async {
            UIApplication.topViewController()?.startLoading()
        }
    }
    
    func stopLoading(){
        UIApplication.topViewController()?.stopLoading()
    }
    
    func didError(_ error: String?){
        guard let error = error else { return }
        MessageBuilder().setBody(error)
            .setTheme(.error)
            .bulid()
    }
}
