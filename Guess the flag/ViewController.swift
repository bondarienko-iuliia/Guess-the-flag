//
//  ViewController.swift
//  Guess the flag
//
//  Created by Iuliia Bondarenko on 30.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!

    @IBOutlet var button2: UIButton!
    
    @IBOutlet var button3: UIButton!
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria","poland","russia","spain", "uk", "us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        askQuestion()
       
        // Do any additional setup after loading the view.
    }
    func askQuestion(action:UIAlertAction! = nil){
        questionsAsked += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        title = countries[correctAnswer].uppercased() + " score: \(score)"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message = ""
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
        }
        else{
            title = "Wrong"
            message = "That’s the flag of \(countries[correctAnswer].uppercased())"
            score -= 1
        }
        if(questionsAsked > 9){
            message = "Your final score is: \(score)"
            score = 0
            questionsAsked = 0
        }
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
}

