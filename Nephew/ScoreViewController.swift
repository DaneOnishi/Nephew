//
//  ScoreViewController.swift
//  Nephew
//
//  Created by Daniella Onishi on 29/07/21.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var returnToMainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // put navigation to work and sees if its storing the points
        scoreLabel.text = ModelSingleton.shared.pointsCounter.description
    }
    @IBAction func returnToMainOnPress(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let chooseLevelVC = storyboard.instantiateViewController(identifier: "ChooseLevelViewController") as? ChooseLevelViewController else { return }
        chooseLevelVC.modalPresentationStyle = .fullScreen
        self.present(chooseLevelVC, animated: true, completion: nil)
    }
    
}
