//
//  QuizViewController.swift
//  Nephew
//
//  Created by Daniella Onishi on 27/07/21.
//

import UIKit


struct Question {
    var questions: String
    var answers: [String]
    var correctAnswer: Int
}

class QuizViewController: UIViewController {
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet var buttons: [UIButton]!

    var questions = [Question]()
    var questionNumber = Int()
    var correctAnswer = Int()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions = [Question(questions: "Qual config mana?", answers: ["CMYK", "RGB", "Hexachrome", "Análogo"], correctAnswer: 1), Question(questions: "Quanto de sangria?", answers: ["0,3", "0,5", "1,0", "sem sangria obv"], correctAnswer: 0)]
        
        pickQuestion()
    }
    
    func pickQuestion() {
        if questions.count > 0 {
            questionNumber = 0
            labelText.text = questions[questionNumber].questions
            correctAnswer = questions[questionNumber].correctAnswer
            
            for i in 0..<buttons.count {
                buttons[i].setTitle(questions[questionNumber].answers[i], for: UIControl.State.normal)
            }
            questions.remove(at: questionNumber)
    
        } else {
            NSLog("done")
        }
    }
    
    @IBAction func buttonOne(_ sender: Any) {
        if correctAnswer == 0 {
            ModelSingleton.shared.scoreSum()
            pickQuestion()
        } else {
            NSLog("wrong")
        }
        
    }
    
    @IBAction func buttonTwo(_ sender: Any) {
        if correctAnswer == 1 {
            ModelSingleton.shared.scoreSum()
            pickQuestion()
        } else {
            NSLog("wrong")
        }
    }
    
    @IBAction func buttonThree(_ sender: Any) {
        if correctAnswer == 2 {
            ModelSingleton.shared.scoreSum()
            pickQuestion()
        } else {
            NSLog("wrong")
        }
    }
    
    @IBAction func buttonFour(_ sender: Any) {
        if correctAnswer == 3 {
            ModelSingleton.shared.scoreSum()
            pickQuestion()
        } else {
            NSLog("wrong")
        }
    }
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
