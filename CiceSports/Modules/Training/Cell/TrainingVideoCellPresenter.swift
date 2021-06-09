//
//  TrainingVideoCellPresenter.swift
//  CiceSports
//
//  Created by cice on 08/06/2021.
//

import Foundation
import WebKit

protocol TrainingVideoCellPresenterProtocol {
    
}


class TrainingVideoCellPresenter: TrainingVideoCellPresenterProtocol{
    
}

extension TrainingVideoCellPresenter: WebKitPresenterProtocol{
    func webViewProvisioningNavigation(_ webView: WKWebView, navigation: WKNavigation!) {
        //self.viewController?.loadActInd(show: true)
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
        //self.viewController?.loadActInd(show: false)
    }

}
