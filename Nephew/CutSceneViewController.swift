//
//  CutSceneViewController.swift
//  Nephew
//
//  Created by Daniella Onishi on 29/07/21.
//

import UIKit

class CutSceneViewController: UIViewController {
    
    @IBOutlet weak var cutSceneLogo: UILabel!
    @IBOutlet weak var disclaimerCutScene: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.1,
                       delay: 1,options: .curveLinear) {
            UIView.modifyAnimations(withRepeatCount: 6, autoreverses: true, animations: {
                self.cutSceneLogo.alpha = 1
            })
        } completion: { _ in
            UIView.animate(withDuration: 0.1,
                           delay: 1,
                           options: .curveLinear) {
                self.cutSceneLogo.alpha = 0
                
            }completion: { _ in
                UIView.animate(withDuration: 0.2,
                               delay: 2,
                               options: .curveEaseInOut) {
                    self.disclaimerCutScene.alpha = 1
                    self.disclaimerCutScene.alpha = 0
                } completion: { _ in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        guard let mainMenuVC = storyboard.instantiateViewController(identifier: "MainMenuViewController") as? MainMenuViewController else {
                            return
                        }
                        mainMenuVC.modalPresentationStyle = .fullScreen
                        
                        self.present(mainMenuVC, animated: true, completion: nil)
                    }
                }
            }
        }
    }
}
