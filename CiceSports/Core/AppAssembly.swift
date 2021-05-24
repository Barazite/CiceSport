//
//  AppAssembly.swift
//  CiceSports
//
//  Created by cice on 24/05/2021.
//

import Foundation
import UIKit

protocol AppAssemblyProtocol{
    func setPrincipalViewController(in window: UIWindow)
}

class AppAssembly: AppAssemblyProtocol{
    
    var actualViewController: UIViewController!
    
    internal func setPrincipalViewController(in window: UIWindow){
        actualViewController = SplashViewController()
        window.rootViewController = actualViewController
        window.makeKeyAndVisible()
    }
}
