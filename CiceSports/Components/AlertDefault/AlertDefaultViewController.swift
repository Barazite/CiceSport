//
//  AlertDefaultViewController.swift
//  CiceSports
//
//  Created by cice on 01/06/2021.
//

import UIKit

@objc protocol AlertDefaultViewControllerDelegate: class {
    @objc optional func defaultPrimaryButtonPressed(type: DefaultAlertType)
    @objc optional func defaultSecondaryButtonPressed(type: DefaultAlertType)
}

class AlertDefaultViewController: UIViewController {

    weak var delegate: AlertDefaultViewControllerDelegate?
    var viewModel: AlertDefaultViewModel?
    var type: DefaultAlertType?
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var primaryButton: UIButton!
    @IBOutlet weak var secondaryButton: UIButton!
    //outlet del constraint
    
    @IBAction func primaryButtonACTION(_ sender: Any) {
        self.dismiss(animated: true){
            self.delegate?.defaultPrimaryButtonPressed?(type: self.type ?? .none)
        }
    }
    
    @IBAction func secundaryButtonACTION(_ sender: Any) {
        self.dismiss(animated: true){
            self.delegate?.defaultSecondaryButtonPressed?(type: self.type ?? .none)
        }
    }
    
    
    @IBAction func closeButtonACTION(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    private func initUI(){
        switch viewModel?.type {
        case .confirmationNavigation:
            self.labelTitle.text = viewModel?.confirmationTitle
            self.labelMessage.text = viewModel?.confirmationMessage
            self.primaryButton.setTitle(viewModel?.confirmationPrimaryButton, for: .normal)
            self.secondaryButton.setTitle(viewModel?.confirmationSecondaryButton, for: .normal)
            //self.secondaryButton.isHidden = true
            //self.constraintBottomPrimaryToSuperView.constant = 20
        default:
            self.labelTitle.text = ""
            self.labelMessage.text = ""
            self.primaryButton.setTitle("", for: .normal)
        }
        self.type = viewModel?.type
    }

}
