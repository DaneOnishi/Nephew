//
//  QuestViewController.swift
//  Nephew
//
//  Created by Daniella Onishi on 29/07/21.
//

import UIKit

class QuestViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var questImage: UIImageView!
    @IBOutlet weak var startQuestButton: UIButton!
    
    var quest: QuestGiven!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //still have to pass image according to the levels (Charges)
        questImage.image = UIImage(named: quest.questImage)
    }
    
    @IBAction func startQuestButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let quizVC = storyboard.instantiateViewController(identifier: "QuizViewController") as? QuizViewController else { return }
        quizVC.modalPresentationStyle = .fullScreen
        self.present(quizVC, animated: true, completion: nil)
    }
}
