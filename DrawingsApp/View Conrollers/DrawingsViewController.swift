//
//  DrawingsViewController.swift
//  DrawingsApp
//
//  Created by FARIT GATIATULLIN on 17.07.2021.
//

import UIKit

protocol SendDataProtocol {
    func sendData(_ :Int)
}


class DrawingsViewController: UIViewController {

    @objc weak var delegate: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "Montserrat-Regular", size: 17)!]
    }
    
    @IBAction func planetAction(_ sender: Any) {
        delegate.selectedPicture = 1
        delegate.readyToDraw()
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func headAction(_ sender: Any) {
        delegate.selectedPicture = 2
        delegate.readyToDraw()
        _ = navigationController?.popViewController(animated: true)
        
    }
 

    
    @IBAction func treeAction(_ sender: Any) {
        delegate.selectedPicture = 3
        delegate.readyToDraw()
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func landscapeAction(_ sender: Any) {
        delegate.selectedPicture = 4
        delegate.readyToDraw()
        _ = navigationController?.popViewController(animated: true)
    }
}
