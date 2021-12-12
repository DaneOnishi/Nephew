//
//  EndingViewController.swift
//  Nephew
//
//  Created by Daniella Onishi on 11/12/21.
//

import UIKit

class EndingViewController: UIViewController {
    
    @IBOutlet weak var cutSceneLogo: UILabel!
    @IBOutlet weak var disclaimerCutScene: UITextView!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.1,
                       delay: 1,options: .curveLinear) {
            UIView.modifyAnimations(withRepeatCount: 6, autoreverses: true, animations: {
                self.textField.alpha = 1
            })
        } completion: { _ in
            UIView.animate(withDuration: 0.1,
                           delay: 1,
                           options: .curveLinear) {
                self.textField.alpha = 0
                
            }completion: { _ in
                UIView.animate(withDuration: 0.8,
                               delay: 2,
                               options: .curveEaseInOut) {
                    self.imageView.alpha = 1
                    self.imageView.alpha = 0
                } 
            }
        }
    }
}
