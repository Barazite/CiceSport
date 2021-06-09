//
//  TrainingVideoCell.swift
//  CiceSports
//
//  Created by cice on 06/06/2021.
//

import UIKit
import WebKit

protocol TrainingVideoCellProtocol {
    func configCell(data: ArrayDiccionariosNivel)
}

class TrainingVideoCell: UITableViewCell, ReuseIdentifierInterface {

    var presenter: TrainingVideoCellPresenterProtocol = TrainingVideoCellPresenter()
    @IBOutlet weak var YoutubePlayerView: UIView!
    
    
    var myWebViewInContainer: WKWebView!
    var webViewManager: WebViewManager?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUICell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func configureUICell(){
        let contentVC = WKUserContentController()
        let config = WKWebViewConfiguration()
        let preference = WKWebpagePreferences()
        
        preference.allowsContentJavaScript = true
        self.myWebViewInContainer = WKWebView(frame: self.YoutubePlayerView.bounds, configuration: config)
        self.myWebViewInContainer.configuration.userContentController = contentVC
        
        self.YoutubePlayerView.addSubview(self.myWebViewInContainer)
        
        self.webViewManager = WebViewManager(pWebView: self.myWebViewInContainer, pPresenter: presenter)
    }
    
}

extension TrainingVideoCell: TrainingVideoCellProtocol{
    func configCell(data: ArrayDiccionariosNivel){
        let url: String = "https://www.youtube.com/embed/" + ((data.arrayEjerciciosResponse?.first) ?? "")
        self.myWebViewInContainer.load(URLRequest(url: URL(string: url)!))
    }
}
