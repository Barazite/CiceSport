//
//  GenericWebViewViewController.swift
//  CiceSports
//
//  Created by cice on 01/06/2021.
//

import UIKit
import WebKit

protocol GenericWebViewViewControllerProtocol {
    func loadWebView(data: String)
    func loadActInd(show: Bool)
}

class GenericWebViewViewController: BaseViewController<GenericWebViewPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    // MARK: - Variables
    var myWebViewInContainer: WKWebView!
    var webViewManager: WebViewManager?
    
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var myWebView: UIView!
    @IBOutlet weak var myActivityIndic: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.loadDataInWebView()
        self.configWebView()
    }
    
    private func configWebView(){
        self.title = "Cice Sports"
        
        self.myActivityIndic.isHidden = false
        self.myActivityIndic.startAnimating()
        
        let contentVC = WKUserContentController()
        let config = WKWebViewConfiguration()
        let preference = WKWebpagePreferences()
        
        preference.allowsContentJavaScript = true
        self.myWebViewInContainer = WKWebView(frame: self.myWebView.bounds, configuration: config)
        self.myWebViewInContainer.configuration.userContentController = contentVC
        
        self.myWebView.addSubview(self.myWebViewInContainer)
        
        self.webViewManager = WebViewManager(pWebView: self.myWebViewInContainer, pPresenter: self.presenter)
    }
}

extension GenericWebViewViewController: GenericWebViewViewControllerProtocol {
    internal func loadActInd(show: Bool) {
        if show {
            self.myActivityIndic.startAnimating()
        }else{
            self.myActivityIndic.stopAnimating()
        }
        self.myActivityIndic.isHidden = !show
    }
    
    internal func loadWebView(data: String) {
        self.myWebViewInContainer.load(URLRequest(url: URL(string: data)!))
    }
    
    
    
}
