//
//  TimerViewController.swift
//  DrawingsApp
//
//  Created by FARIT GATIATULLIN on 19.07.2021.
//

import Foundation
import UIKit


class TimerViewController: UIViewController {
    @IBOutlet weak var saveButton: CustomButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var timeLabel: UILabel!
    let sharedManager = MyManager.sharedManager() as! MyManager
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.value = Float(sharedManager.time);
        timeLabel.text = "\(slider.value)" + " s"
        view.layer.cornerRadius = 40
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        
        saveButton.adjustsImageWhenHighlighted = false

        saveButton.adjustsImageWhenDisabled = false
    }
    

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Double(slider.value).mrounded(toPlaces: 2)
        timeLabel.text = "\(currentValue)" + " s"
        sharedManager.time = currentValue
        
    }
    @IBAction func save(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension Double {
    func mrounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
