//
//  BaseVIPER.swift
//  CiceSports
//
//  Created by cice on 24/05/2021.
//

import Foundation
import UIKit
import PKHUD

//MARK: - BaseViewController
class BaseViewController<P> : UIViewController{
    var presenter: P?
    
    //MARK: LIFE CICLE
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showLoading(view: UIView, animated: Bool){
        //MBProgressHUD.showAdded(to: view, animated: animated)
        HUD.show(.progress)
    }
    
    func hideLoading(view: UIView, animated: Bool){
        //MBProgressHUD.hide(for: view, animated: animated)
        HUD.hide()
    }
}

// MARK: - BasePresenter
class BasePresenter<V, R, I> {
    
    internal var viewController: V?
    internal var router: R?
    internal var interactor: I?
    
    convenience init(viewController: V, router: R? = nil, interactor: I? = nil){
        self.init()
        self.viewController = viewController
        self.router = router
        self.interactor = interactor
    }
}


// MARK: - BaseInteractor
class BaseInteractor<P>{
    
    internal var presenter: P?
    
    convenience init(presenter: P){
        self.init()
        self.presenter = presenter
    }
}


// MARK: - BaseRouter
class BaseRouter<P>{
    
    internal var presenter: P?
    internal var viewController: UIViewController?
    
    convenience init(presenter: P? = nil, view: UIViewController? = nil) {
        self.init()
        self.presenter = presenter
        self.viewController = view
    }
    
    internal func show (_ vc: UIViewController){
        if let navigationController = viewController?.navigationController{
            navigationController.pushViewController(vc, animated: true)
        }
    }
    
    internal func present(_ vcToPresent: UIViewController, animated flag: Bool, completion: (() -> Swift.Void)? = nil){
        if let navigationController = viewController?.navigationController{
            navigationController.present(vcToPresent, animated: flag, completion: completion)
            return
        }
        viewController?.present(vcToPresent, animated: flag, completion: completion)
    }
}


// MARK: - BaseNavigationController
class BaseNavigationController: UINavigationController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
