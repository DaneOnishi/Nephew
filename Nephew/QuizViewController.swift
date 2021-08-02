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
    @IBOutlet weak var questCard: UIImageView!
    @IBOutlet weak var startQuizButton: UIButton?
    
    var questions = [Question]()
    var questionNumber = Int()
    var correctAnswer = Int()
    var pointsCounter = ModelSingleton.shared.pointsCounter
    let generator = UINotificationFeedbackGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        if questions.count == 0 {
            presentScoreView()
        } else {
            pickQuestion()
        }
        
        //        if self.pointsCounter < 6{
        //            questCard.image = UIImage(named: "Quest-One-Card")
        //        } else if self.pointsCounter >= 6 && self.pointsCounter < 12 {
        //            questCard.image = UIImage(named: "Quest-Two-Card")
        //        } else if self.pointsCounter >= 12 && self.pointsCounter < 18 {
        //            questCard.image = UIImage(named: "Quest-Three-Card")
        //        } else if self.pointsCounter >= 18 {
        //            questCard.image = UIImage(named: "Quest-Four-Card")
        //        }
        
    }
    //    override func viewDidAppear(_ animated: Bool) {
    //        UIView.animate(withDuration: 8, delay: 0, options: .curveLinear) {
    //            self.questCard.alpha = 0
    //        }
    //    }
    
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
            presentScoreView()
        }
    }
    
    func setup(questions: [Question]) {
        self.questions = questions
    }
    
    @IBAction func buttonOne(_ sender: Any) {
        if correctAnswer == 0 {
            ModelSingleton.shared.scoreSum()
            pickQuestion()
            generator.notificationOccurred(.success)
        } else {
            pickQuestion()
            generator.notificationOccurred(.error)
        }
    }
    
    @IBAction func buttonTwo(_ sender: Any) {
        if correctAnswer == 1 {
            ModelSingleton.shared.scoreSum()
            pickQuestion()
            generator.notificationOccurred(.success)
        } else {
            pickQuestion()
            generator.notificationOccurred(.error)
        }
    }
    
    @IBAction func buttonThree(_ sender: Any) {
        if correctAnswer == 2 {
            ModelSingleton.shared.scoreSum()
            pickQuestion()
            generator.notificationOccurred(.success)
        } else {
            pickQuestion()
            generator.notificationOccurred(.error)
        }
    }
    
    @IBAction func buttonFour(_ sender: Any) {
        if correctAnswer == 3 {
            ModelSingleton.shared.scoreSum()
            pickQuestion()
            generator.notificationOccurred(.success)
        } else {
            pickQuestion()
            generator.notificationOccurred(.error)
        }
    }
    
    
    func presentScoreView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let scoreVC = storyboard.instantiateViewController(identifier: "ScoreViewController") as? ScoreViewController else { return }
        scoreVC.modalPresentationStyle = .fullScreen
        self.present(scoreVC, animated: true, completion: nil)
    }
}
