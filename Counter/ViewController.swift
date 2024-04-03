//
//  ViewController.swift
//  Counter
//
//  Created by Nikita on 03.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyChange: UITextView!
    @IBOutlet weak var counterLabel: UILabel!
    
    
    func appendToHistoryChange(message: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: Date())

        storyChange.text += "\n[\(dateString)]: \(message)"
        let range = NSMakeRange(storyChange.text.count - 1, 1)
        storyChange.scrollRangeToVisible(range)
    }
    
    var countTouch = 0 {
           didSet {
               updateCounterLabel()
           }
       }

       override func viewDidLoad() {
           super.viewDidLoad()
           counterLabel.text = "Значение счетчика \(countTouch)"
           counterLabel.adjustsFontSizeToFitWidth = true
           counterLabel.minimumScaleFactor = 0.5
           counterLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
           counterLabel.textColor = UIColor.white
           counterLabel.textAlignment = .center
           counterLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
           counterLabel.layer.cornerRadius = 10
           counterLabel.clipsToBounds = true
       }

       @IBAction func plusCount(_ sender: UIButton) {
           updateCountTouch(action: .increment)
           appendToHistoryChange(message: "значение изменено на +1")
       }

       @IBAction func minusCount(_ sender: UIButton) {
           updateCountTouch(action: .decrement)
           
       }

       @IBAction func breakCounter(_ sender: UIButton) {
           updateCountTouch(action: .reset)
           appendToHistoryChange(message: "значение сброшено")
       }
       
       func updateCounterLabel() {
           counterLabel.text = "Значение счетчика \(countTouch)"
       }

       func updateCountTouch(action: CounterAction) {
           switch action {
           case .increment:
               countTouch += 1
           case .decrement:
               if countTouch > 0 {
                   countTouch -= 1
                   appendToHistoryChange(message: "значение изменено на -1")
               } else {
                   appendToHistoryChange(message: "попытка уменьшить значение счётчика ниже 0")
               }
           case .reset:
               countTouch = 0
           }
       }
       
       enum CounterAction {
           case increment
           case decrement
           case reset
       }
       
    

}

