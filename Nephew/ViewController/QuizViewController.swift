//
//  QuizViewController.swift
//  Nephew
//
//  Created by Daniella Onishi on 27/07/21.
//

import UIKit
import AVFoundation

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
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var leftImage: UIImageView!
    
    var currentPhases: Charges = .EternalNephew
    var questions = [Question]()
    var questionNumber = Int()
    var correctAnswer = Int()
    var pointsCounter = ModelSingleton.shared.pointsCounter
    let generator = UINotificationFeedbackGenerator()
    var currentProgress: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightImageName = currentPhases.progressBarRightImage
        let leftImageName = currentPhases.progressBarLeftImage
        
     
        if questions.count == 0 {
            presentScoreView()
        } else {
            pickQuestion()
        }
        
        rightImage.image = UIImage(named: rightImageName)
        leftImage.image = UIImage(named: leftImageName)
        
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
            presentScoreView()
        }
    }
    
    func setup(questions: [Question]) {
        self.questions = questions
    }
    
    func increaseProgressBar() {
        guard currentProgress < 1 else { return }
        currentProgress += 1 / Float(currentPhases.minimumScoreToNextLevel)
        progressBar.setProgress(currentProgress, animated: true)
    }
    
    func processButton(number: Int) {
        if correctAnswer == number {
            ModelSingleton.shared.scoreSum()
            pickQuestion()
            generator.notificationOccurred(.success)
            increaseProgressBar()
        } else {
            pickQuestion()
            generator.notificationOccurred(.error)
        }
        
        SFXMusicSingleton.shared.soundPopPops()
    }
    
    
    @IBAction func buttonOne(_ sender: Any) {
        processButton(number: 0)
    }
    
    @IBAction func buttonTwo(_ sender: Any) {
       processButton(number: 1)
    }
    
    @IBAction func buttonThree(_ sender: Any) {
       processButton(number: 2)
    }
    
    @IBAction func buttonFour(_ sender: Any) {
        processButton(number: 3)
    }
    
    
    func presentScoreView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let scoreVC = storyboard.instantiateViewController(identifier: "ScoreViewController") as? ScoreViewController else { return }
        scoreVC.modalPresentationStyle = .fullScreen
        self.present(scoreVC, animated: true, completion: nil)
    }
}
