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
    @IBOutlet weak var congratsPhraseTwo: UIImageView!
    @IBOutlet weak var congratsPhraseThree: UIImageView!
    @IBOutlet weak var congratsPhraseFour: UIImageView!
    @IBOutlet weak var congratsPhraseFive: UIImageView!
    var scorePoints = ModelSingleton.shared.pointsCounter
    var minimumScorePointsToLevel2 = 6
    var minimumScorePointsToLevel3 = 12
    var minimumScorePointsToLevel4 = 18
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // put navigation to work and sees if its storing the points
        scoreLabel.text = ("\(ModelSingleton.shared.pointsCounter.description) Pontos")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.2, delay: 2, options: .curveEaseInOut) {
            self.scoreLabel.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.congratsPhrase.alpha = 1
            } completion: { _ in
                UIView.animate(withDuration: 0.2) {
                    self.congratsPhrase.alpha = 0
                    self.congratsPhraseTwo.alpha = 1
                } completion: { _ in
                    UIView.animate(withDuration: 0.2) {
                        self.congratsPhraseTwo.alpha = 0
                        self.congratsPhraseThree.alpha = 1
                    } completion: { _ in
                        UIView.animate(withDuration: 0.2) {
                            self.congratsPhraseThree.alpha = 0
                            self.congratsPhraseFour.alpha = 1
                        } completion: { _ in
                            UIView.animate(withDuration: 0.2) {
                                self.congratsPhraseFour.alpha = 0
                                self.congratsPhraseFive.alpha = 1
                            } completion: { _ in
                                UIView.animate(withDuration: 0.2) {
                                    self.congratsPhraseFive.alpha = 0
                                } completion: { _ in
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                        guard let chooseLevelVC = storyboard.instantiateViewController(identifier: "ChooseLevelViewController") as? ChooseLevelViewController else { return }
                                        chooseLevelVC.modalPresentationStyle = .fullScreen
                                        self.present(chooseLevelVC, animated: true, completion: nil)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func changeCongrats() {
        if scorePoints >= minimumScorePointsToLevel2 && scorePoints <= minimumScorePointsToLevel3  {
            congratsImage.image = UIImage(named: "QuestOne_GoodEnding")
            congratsPhrase.image = UIImage(named: "Meh")
            congratsPhraseTwo.image = UIImage(named: "Meh")
            congratsPhraseThree.image = UIImage(named: "Meh")
            congratsPhraseFour.image = UIImage(named: "Meh")
            congratsPhraseFive.image = UIImage(named: "Meh")
        } else if scorePoints <= minimumScorePointsToLevel2 {
            congratsImage.image = UIImage(named: "QuestOne_BadEnding")
            congratsPhrase.image = UIImage(named: "Meh")
            congratsPhraseTwo.image = UIImage(named: "Meh")
            congratsPhraseThree.image = UIImage(named: "Meh")
            congratsPhraseFour.image = UIImage(named: "Meh")
            congratsPhraseFive.image = UIImage(named: "Meh")
        } else if scorePoints >= minimumScorePointsToLevel3 {
            congratsImage.image = UIImage(named: "QuestThree-GoodEnding")
            congratsPhrase.image = UIImage(named: "Meh")
            congratsPhraseTwo.image = UIImage(named: "Meh")
            congratsPhraseThree.image = UIImage(named: "Meh")
            congratsPhraseFour.image = UIImage(named: "Meh")
            congratsPhraseFive.image = UIImage(named: "Meh")
        } else if scorePoints <= minimumScorePointsToLevel3 {
            congratsImage.image = UIImage(named: "QuestThree-BadEnding")
            congratsPhrase.image = UIImage(named: "Meh")
            congratsPhraseTwo.image = UIImage(named: "Meh")
            congratsPhraseThree.image = UIImage(named: "Meh")
            congratsPhraseFour.image = UIImage(named: "Meh")
            congratsPhraseFive.image = UIImage(named: "Meh")
        }
    }
    
    
    
    @IBAction func returnToMainOnPress(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let chooseLevelVC = storyboard.instantiateViewController(identifier: "ChooseLevelViewController") as? ChooseLevelViewController else { return }
        chooseLevelVC.modalPresentationStyle = .fullScreen
        self.present(chooseLevelVC, animated: true, completion: nil)
    }
    
}
