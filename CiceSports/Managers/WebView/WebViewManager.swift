//
//  WebViewManager.swift
//  CiceSports
//
//  Created by cice on 04/06/2021.
//

import Foundation
import WebKit

class WebViewManager: NSObject {
    
    private weak var wkWebView: WKWebView?
    private weak var presenter: WebKitPresenterProtocol?
    
    init(pWebView: WKWebView?, pPresenter: Any?){
        super.init()
        self.wkWebView = pWebView
        self.presenter = pPresenter as? WebKitPresenterProtocol
        self.setup()
    }
    
    private func setup(){
        self.wkWebView?.navigationDelegate = self
    }
    
}

extension WebViewManager: WKNavigationDelegate{
    
}
