//
//  ChooseLevelViewController.swift
//  Nephew
//
//  Created by Daniella Onishi on 28/07/21.
//

import UIKit
import AVFoundation

class ChooseLevelViewController: UIViewController {
    
    @IBOutlet weak var seniorFloppy: UIImageView!
    @IBOutlet weak var plenoFloppy: UIImageView!
    @IBOutlet weak var juniorFloppy: UIImageView!
    @IBOutlet weak var eternalNephewFloppy: UIImageView!
    @IBOutlet weak var chooseFreelaLabel: UILabel!
    @IBOutlet weak var computer: UIImageView!
    
    var floppyViewOrigin: CGPoint!
    var unlockedCharges: [Charges: Bool] {
        ScoresRepository.shared.GETTTTTTTTTTTTTTTTUnlockedChages()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPanGesture(view: eternalNephewFloppy)
        addPanGesture(view: juniorFloppy)
        addPanGesture(view: plenoFloppy)
        addPanGesture(view: seniorFloppy)
        
        view.bringSubviewToFront(eternalNephewFloppy)
        view .bringSubviewToFront(juniorFloppy)
        view .bringSubviewToFront(plenoFloppy)
        view .bringSubviewToFront(seniorFloppy)
        
        eternalNephewFloppy.isUserInteractionEnabled = true
        juniorFloppy.isUserInteractionEnabled = false
        plenoFloppy.isUserInteractionEnabled = false
        seniorFloppy.isUserInteractionEnabled = false
        juniorFloppy.alpha = 0.4
        plenoFloppy.alpha = 0.4
        seniorFloppy.alpha = 0.4
        
        if unlockedCharges[.Junior]! {
            juniorFloppy.isUserInteractionEnabled = true
            juniorFloppy.alpha = 1
        }
        
        if unlockedCharges[.Pleno]! {
            plenoFloppy.isUserInteractionEnabled = true
            plenoFloppy.alpha = 1
        }
        
        if unlockedCharges[.Senior]! {
            seniorFloppy.isUserInteractionEnabled = true
            seniorFloppy.alpha = 1
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .repeat) {
            self.chooseFreelaLabel.alpha = 0
        } completion: { _ in
            self.chooseFreelaLabel.alpha = 1
        }
        
    }
    
    func addPanGesture(view: UIView) {
        let pan =  UIPanGestureRecognizer(target: self, action: #selector(ChooseLevelViewController.handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        let floppyView = sender.view!
        let translation = sender.translation(in: view)
        
        switch sender.state {
        case .began:
            self.floppyViewOrigin = floppyView.frame.origin
        case .changed:
            floppyView.center = CGPoint(x: (floppyView.center.x) + translation.x, y: (floppyView.center.y) + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
        case .ended:
            if floppyView.frame.intersects(computer.frame) {
                UIView.animate(withDuration: 0.3) {
                    floppyView.alpha = 0.0
                    SFXMusicSingleton.shared.soundPopPops()
                } completion: { _ in
                    var level = Charges.EternalNephew
                    if floppyView == self.juniorFloppy {
                        level = .Junior
                    } else if floppyView == self.plenoFloppy {
                        level = .Pleno
                    } else if floppyView == self.seniorFloppy {
                        level = .Senior
                    }
                    self.presentQuiz(charges: level)
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    floppyView.frame.origin = self.floppyViewOrigin
                }
            }
        default:
            break
        }
    }
    
    func presentQuiz(charges: Charges) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let questVC = storyboard.instantiateViewController(identifier: "QuestViewController") as? QuestViewController else {
            return
        }
        questVC.modalPresentationStyle = .fullScreen
        questVC.charges = charges
        ModelSingleton.shared.currentCharge = charges
        self.present(questVC, animated: true, completion: nil)
    }
}
