//
//  BaseController.swift
//
//  Created by Mahmoud Heshmat on 3/21.
//

import UIKit

class BaseController: UIViewController, Observable, POPUPModal {

    //This property for hide and unhide navigation bar
    var disposeBag: DisposableBag = .init()
    var hideNav: Bool = true
    var emptyScreen: EmptyScreen!
    var maintanceScreen: MaintanceScreen!
    var networkScreen: NetworkFailScreen!
    var isBackHome: Bool = false
    // This action for any back for all pages
    @IBAction dynamic func backBtn(_ sender: Any) {
        if isBackHome {
            Coordinator.instance.restart()
        }else{
//            if self.navigationController?.viewControllers.first == self {
//                print("anananannanqq")
//                self.dismiss(animated: true, completion: nil)
//            } else {
//                self.navigationController?.popViewController(animated: true)
//            }
            self.navigationController?.popViewController(animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.removeSubviews()
        self.navigationItem.setHidesBackButton(true, animated: false)
        if Localizer.current == .arabic {
            self.navigationController?.view.semanticContentAttribute = .forceRightToLeft
            self.navigationController?.navigationBar.semanticContentAttribute = .forceRightToLeft
        } else {
            self.navigationController?.view.semanticContentAttribute = .forceLeftToRight
            self.navigationController?.navigationBar.semanticContentAttribute = .forceLeftToRight
        }
        self.setupBase()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.hideNav {
            // hide the Navigation Bar
            self.navigationController?.setNavigationBarHidden(true, animated: false )
            self.navigationController?.navigationBar.shadowImage = UIImage()
        } else {
            self.navigationController?.setNavigationBarHidden(false, animated: false)
        }
        self.navigationController?.navigationBar.removeSubviews()
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.hideNav {
            // hide the Navigation Bar
            self.navigationController?.setNavigationBarHidden(true, animated: false)
            self.navigationController?.navigationBar.shadowImage = UIImage()

        } else {
            self.navigationController?.setNavigationBarHidden(false, animated: false)
        }
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        self.stopLoading()
    }
    @objc dynamic func bind() {
        
    }
}

extension BaseController: BaseViewControllerProtocol, Alertable {
    func setupBase() {
        //reset paginator
        NetworkManager.instance.resetPaginate()
        //binding
    }
}

extension BaseController: PresentingViewProtocol, EmptyScreenContract, MaintanceScreenContract, NetworkFailScreenContract {
    @objc func didError(error: String?) {
        MessageBuilder().setBody(error ?? "").setTheme(.error).bulid()
    }
}
