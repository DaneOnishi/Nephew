//
//  MainMenuViewController.swift
//  Nephew
//
//  Created by Daniella Onishi on 28/07/21.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var startingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.1,
                       delay: 1,
                       options: .repeat) {
            self.logoLabel.alpha = 0
            self.logoLabel.alpha = 1
        } 
    }
    
    @IBAction func pressStartButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let chooseLevelVC = storyboard.instantiateViewController(identifier: "ChooseLevelViewController") as? ChooseLevelViewController else { return }
        chooseLevelVC.modalPresentationStyle = .fullScreen
        self.present(chooseLevelVC, animated: true, completion: nil)
    }
}
