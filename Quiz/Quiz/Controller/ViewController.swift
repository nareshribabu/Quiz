//
//  ViewController.swift
//  Quiz
//  Created by Nareshri Babu on 2020-04-19.
//  Concept by London App Brewery
//  Copyright © 2020 Nareshri Babu. All rights reserved.
//  This app was created for learning purposes.
//  All images were only used for learning purposes and do not belong to me.
//  All sounds were only used for learning purposes and do not belong to me.
//

import UIKit

class ViewController: UIViewController {
    
    //Button Connections
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    //we are creating an instance of the QuizBrain struct
    var quizBrain = QuizBrain()
    
    
    var resetProgressBar = 0 //make it 1 if you have to reset
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        //progressBar.progress = 0.0
    }
    
    //triggered whenever any of the buttons are pressed
    @IBAction func answerButtonPressed(_ sender: UIButton) {
       
        let userAnswer = sender.currentTitle! //True or False
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        //the color change only lasts for 0.2 seconds and then changes to clear
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        

        
    }
    
    @objc func updateUI() {
        
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        
        
        
    }
    
 
}

