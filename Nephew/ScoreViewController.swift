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
    @IBOutlet weak var congratsImage: UIImageView!
    @IBOutlet weak var congratsPhrase: UIImageView!
    var scorePoints = ModelSingleton.shared.pointsCounter
    var minimumScorePointsToLevel2 = 6
    var minimumScorePointsToLevel3 = 12
    var minimumScorePointsToLevel4 = 18
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // put navigation to work and sees if its storing the points
        scoreLabel.text = ModelSingleton.shared.pointsCounter.description
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.6, delay: 6, options: .curveEaseInOut) {
            self.congratsImage.alpha = 0
            self.congratsPhrase.alpha = 0
        }
    }
    
    func changeCongrats() {
        if scorePoints >= minimumScorePointsToLevel2 && scorePoints <= minimumScorePointsToLevel3  {
            congratsImage.image = UIImage(named: "")
            congratsPhrase.image = UIImage(named: "")
        } else if scorePoints <= minimumScorePointsToLevel2 {
            congratsImage.image = UIImage(named: "")
            congratsPhrase.image = UIImage(named: "")
        } else if scorePoints >= minimumScorePointsToLevel3 {
            congratsImage.image = UIImage(named: "")
            congratsPhrase.image = UIImage(named: "")
        } else if scorePoints <= minimumScorePointsToLevel3 {
            congratsImage.image = UIImage(named: "")
            congratsPhrase.image = UIImage(named: "")
        }
    }
    
    @IBAction func returnToMainOnPress(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let chooseLevelVC = storyboard.instantiateViewController(identifier: "ChooseLevelViewController") as? ChooseLevelViewController else { return }
        chooseLevelVC.modalPresentationStyle = .fullScreen
        self.present(chooseLevelVC, animated: true, completion: nil)
    }
    
}
