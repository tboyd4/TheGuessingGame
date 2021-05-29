//
//  ViewController.swift
//  FlagGuessingGame
//
//  Created by Tyler Boyd on 5/28/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries: [String] = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    var score = 0
    var correctAnswer = 0
    var currentQuestion = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
       
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(currentQuestion).) \(countries[correctAnswer].uppercased()) -- Current Score: \(score)"
    }
    
    func resetGame(action: UIAlertAction) {
        score = 0
        correctAnswer = 0
        currentQuestion = 1
        askQuestion()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var dynaMessage: String
        
        if (sender.tag == correctAnswer) {
            title = "Correct"
            dynaMessage = "Nice!"
            score += 1
        } else {
            title = "Wrong"
            dynaMessage = "You chose the \(countries[sender.tag].uppercased()) flag."
            score -= 1
        }
        if currentQuestion < 10 {
            let ac = UIAlertController(title: title, message: "\(dynaMessage). You now have a score of \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "The Game Is Over!", message: "You ended with a final score of \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Start Over", style: .default, handler: resetGame))
            present(ac, animated: true)
        }
        
        currentQuestion += 1
    }
    

}
