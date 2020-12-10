//
//  ViewController.swift
//  Quizzler
//
//  Created by Dayton on 11/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstChoice: UIButton!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    
   
    
    var quizBrain = QuizBrain()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
       

        }
     
    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else {
            sender.backgroundColor = UIColor.red
        }
       
        
        quizBrain.nextQuestion()
       
       Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI(){
        
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgressLabel()
        scoreLabel.text = "Score: \(quizBrain.getScore()) "
        
        // reset the background of the third button also.
        firstChoice.backgroundColor = UIColor.clear
        
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
        
        
        // fetch the answers and update the button titles using the setTitle method.
         let answerChoices = quizBrain.getChoiceAnswer()
        firstChoice.setTitle(answerChoices[0], for: .normal)
        trueBtn.setTitle(answerChoices[1], for: .normal)
        falseBtn.setTitle(answerChoices[2], for: .normal)
        
       
        
    }
    
    
}


