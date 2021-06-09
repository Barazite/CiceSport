// GenericWebViewPresenter.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation
import WebKit

protocol GenericWebViewPresenterProtocol {
    func loadDataInWebView()
}

class GenericWebViewPresenterImpl: BasePresenter<GenericWebViewViewControllerProtocol, GenericWebViewRouterProtocol, GenericWebViewInteractorProtocol> {
    
    //var interactor: GenericWebViewInteractorProtocol?
    
}


extension GenericWebViewPresenterImpl: GenericWebViewPresenterProtocol {
    internal func loadDataInWebView() {
        #if DEV
        let url = "https://www.planttext.com/"
        #elseif PRE
        let url = "https://www.google.com/"
        #elseif PRO
        let url = "https://www.cice.com/"
        #endif
        self.viewController?.loadWebView(data: url)
    }
    
}

extension GenericWebViewPresenterImpl: WebKitPresenterProtocol{
    
    func webViewProvisioningNavigation(_ webView: WKWebView, navigation: WKNavigation!) {
        self.viewController?.loadActInd(show: true)
    }
    
    func webViewNavigationFailed(_ webView: WKWebView, navigation: WKNavigation!, error: Error) {
        //
    }
    
    func webViewNavigationActionResponse(_ webView: WKWebView, response: WKNavigationResponse, handler: @escaping (WKNavigationResponsePolicy) -> ()) {
        handler(.allow)
    }
    
    func webViewNavigationActionRequest(_ webView: WKWebView, actionRequest: WKNavigationAction, handler: @escaping (WKNavigationActionPolicy) -> ()) {
        handler(.allow)
    }
    
    func webViewDidFinish(_ webView: WKWebView, navigation: WKNavigation!) {
        self.viewController?.loadActInd(show: false)
    }
}
