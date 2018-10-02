

// Created on: Sept-2018
// Created by: Brody Macneil 
// Created for: ICS3U
// This program will calculate price of pizza from user inputs
// this will be commented out when code moved to Xcode
import PlaygroundSupport


import UIKit

class ViewController : UIViewController {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    let RENT_PRICE : Float = 1.00
    let LABOUR_PRICE : Float = 0.75
    let MATERIAL_PRICE : Float = 0.50
    let TAX_PERCENTAGE : Float = 0.13
    
    let instructionsLabel : UILabel = UILabel()
    let diameterLabel : UILabel = UILabel()
    let priceLabel : UILabel = UILabel()
    let diameterTextField : UITextField = UITextField()
    let calculateButton : UIButton = UIButton()
    
    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view = view
        
        instructionsLabel.text = "Enter Circumference to calculate pizza price "
        view.addSubview(instructionsLabel)
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        instructionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        diameterLabel.text = "Enter Diameter: "
        view.addSubview(diameterLabel)
        diameterLabel.translatesAutoresizingMaskIntoConstraints = false
        diameterLabel.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 20).isActive = true
        diameterLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        diameterTextField.borderStyle = UITextBorderStyle.roundedRect
        diameterTextField.placeholder = "    inches"
        view.addSubview(diameterTextField)
        diameterTextField.translatesAutoresizingMaskIntoConstraints = false
        diameterTextField.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 20).isActive = true
        diameterTextField.leadingAnchor.constraint(equalTo: diameterLabel.trailingAnchor, constant: 10).isActive = true
        
        calculateButton.setTitle("Calculate", for: UIControlState.normal)
        calculateButton.setTitleColor(.blue, for: .normal)
        calculateButton.addTarget(self, action: #selector(calculatePrice), for: .touchUpInside)
        view.addSubview(calculateButton)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calculateButton.topAnchor.constraint(equalTo: diameterLabel.bottomAnchor, constant: 25).isActive = true
        
        view.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true

    }
    
    
    @objc func calculatePrice() {
        // calculate and show area and perimeter 
        let diameter : Float = Float(diameterTextField.text!)!
        
        let formatAsCurrency = NumberFormatter()
        formatAsCurrency.numberStyle = .currency 
        
        let cost = (diameter * MATERIAL_PRICE) + RENT_PRICE + LABOUR_PRICE
        let HST = cost * TAX_PERCENTAGE
        let totalCost = cost + HST as NSNumber
        
        priceLabel.text = "The price is \(formatAsCurrency.string(from:totalCost)!)"
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// this will be commented out when code moved to Xcode
PlaygroundPage.current.liveView = ViewController()
