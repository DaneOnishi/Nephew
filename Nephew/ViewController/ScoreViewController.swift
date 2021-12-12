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
    let currentCharge = ModelSingleton.shared.currentCharge!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // put navigation to work and sees if its storing the points
        scoreLabel.text = ("\(ModelSingleton.shared.pointsCounter.description) Pontos")
        
        if scorePoints >= currentCharge.minimumScoreToNextLevel ,
           let nextCharge = currentCharge.nextCharge {
            ScoresRepository.shared.unlockCharge(charge: nextCharge)
        }

        changeCongrats()
        view.sendSubviewToBack(congratsImage)
        
        if scorePoints >= 24 {
            presentEndingScene()
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseInOut) {
           self.scoreLabel.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0.05, options: .curveEaseInOut) {
                self.congratsPhrase.alpha = 1

            } completion: { _ in
                UIView.animate(withDuration: 0.3, delay: 0.05, options: .curveEaseInOut) {
                   self.congratsPhrase.alpha = 0
                    self.congratsPhraseTwo.alpha = 1
    
                } completion: { _ in
                    UIView.animate(withDuration: 0.3, delay: 0.05, options: .curveEaseInOut) {
                       self.congratsPhraseTwo.alpha = 0
                        self.congratsPhraseThree.alpha = 1
        
                    } completion: { _ in
                        UIView.animate(withDuration: 0.3, delay: 0.05, options: .curveEaseInOut) {
                           self.congratsPhraseThree.alpha = 0
                            self.congratsPhraseFour.alpha = 1
            
                        } completion: { _ in
                            UIView.animate(withDuration: 0.3, delay: 0.05, options: .curveEaseInOut) {
                               self.congratsPhraseFour.alpha = 0
                                self.congratsPhraseFive.alpha = 1
                
                            } completion: { _ in
                                UIView.animate(withDuration: 0.3, delay: 0.05, options: .curveEaseInOut) {
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
        var congratsImageName = currentCharge.congratsImage
        var congratsPhraseName = currentCharge.congratsPhrase
        
        if  scorePoints > currentCharge.minimumScoreToNextLevel {
            congratsImageName = currentCharge.congratsImage
            congratsPhraseName = currentCharge.congratsPhrase
        } else if scorePoints < currentCharge.minimumScoreToNextLevel {
            congratsImageName = currentCharge.defeatImage
            congratsPhraseName = currentCharge.defeatPhrase
        }
    
            congratsImage.image = UIImage(named: congratsImageName)
            congratsPhrase.image = UIImage(named: congratsPhraseName)
            congratsPhraseTwo.image = UIImage(named: congratsPhraseName)
            congratsPhraseThree.image = UIImage(named: congratsPhraseName)
            congratsPhraseFour.image = UIImage(named: congratsPhraseName)
            congratsPhraseFive.image = UIImage(named: congratsPhraseName)
    }
    
    
    @IBAction func returnToMainOnPress(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let chooseLevelVC = storyboard.instantiateViewController(identifier: "ChooseLevelViewController") as? ChooseLevelViewController else { return }
        chooseLevelVC.modalPresentationStyle = .fullScreen
        self.present(chooseLevelVC, animated: true, completion: nil)
        ModelSingleton.shared.resetQuiz()
        ModelSingleton.shared.resetProgressBar()
        
    }
    
    func presentEndingScene() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let endingVC = storyboard.instantiateViewController(identifier: "EndingViewController") as? EndingViewController else { return }
        endingVC.modalPresentationStyle = .fullScreen
        self.present(endingVC, animated: true, completion: nil)
    }
    
}
