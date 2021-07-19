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

    @IBOutlet weak var planet: CustomButton!
    @IBOutlet weak var head: CustomButton!
    @IBOutlet weak var tree: CustomButton!
    @IBOutlet weak var landscape: CustomButton!
    
    @objc weak var delegate: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "Montserrat-Regular", size: 17)!]
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let buttons: [CustomButton] = [planet, tree, head, landscape]
        for i in 0...3 {
            buttons[i].setHighlighted(false)
        }
        let selectedButton = delegate.selectedPicture
        
        switch selectedButton {
        case 1:
            planet.setHighlighted(true)
        case 2:
            head.setHighlighted(true)
        case 3:
            tree.setHighlighted(true)
        case 4:
            landscape.setHighlighted(true)
        default:
            break
        }
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
