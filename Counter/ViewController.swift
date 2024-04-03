//
//  ViewController.swift
//  Counter
//
//  Created by Nikita on 03.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var outletBotton: UIButton!
    var countTouch = 0
    
    
    @IBAction func botton(_ sender: UIButton) {
        
        countTouch += 1
        counterLabel.text = "Значение счетчика \(countTouch)"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.adjustsFontSizeToFitWidth = true
        counterLabel.minimumScaleFactor = 0.5
        counterLabel.text = "Значение счетчика \(countTouch)"
        counterLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        counterLabel.textColor = UIColor.white
        counterLabel.textAlignment = .center
        counterLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        counterLabel.layer.cornerRadius = 10
        counterLabel.clipsToBounds = true
        
        
        outletBotton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            outletBotton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            outletBotton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            outletBotton.widthAnchor.constraint(equalToConstant: 200),
            outletBotton.heightAnchor.constraint(equalToConstant: 50)
        ])

            outletBotton.setTitle("Тапни меня", for: .normal)
            outletBotton.titleLabel?.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
            outletBotton.setTitleColor(UIColor.white, for: .normal)
            outletBotton.backgroundColor = UIColor.systemBrown
            outletBotton.layer.cornerRadius = 20
            outletBotton.layer.shadowColor = UIColor.darkGray.cgColor
            outletBotton.layer.shadowOffset = CGSize(width: 0, height: 2)
            outletBotton.layer.shadowOpacity = 0.5
            outletBotton.layer.shadowRadius = 2
        
        
        
    }


}

