//
//  QuestViewController.swift
//  Nephew
//
//  Created by Daniella Onishi on 29/07/21.
//

import UIKit
import AVFoundation

class QuestViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var startQuestButton: UIButton!
    
    var quest: QuestGiven!
    var pointsCounter = ModelSingleton.shared.pointsCounter
    var charges: Charges?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //still have to pass image according to the levels (Charges)
        backgroundImage.image = UIImage(named: charges?.questImage ?? "")
    }
    
    @IBAction func startQuestButtonPressed(_ sender: Any) {
        presentQuiz(level: charges!)
        SFXMusicSingleton.shared.soundPopPops()
    }
    
    
    func presentQuiz(level: Charges) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let quizVC = storyboard.instantiateViewController(identifier: "QuizViewController") as? QuizViewController else {
            return
        }
        quizVC.modalPresentationStyle = .fullScreen
        quizVC.setup(questions: ModelSingleton.shared.questions[level]!)
        self.present(quizVC, animated: true, completion: nil)
    }
}
