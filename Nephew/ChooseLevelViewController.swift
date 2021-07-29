//
//  ChooseLevelViewController.swift
//  Nephew
//
//  Created by Daniella Onishi on 28/07/21.
//

import UIKit

class ChooseLevelViewController: UIViewController {
    
    @IBOutlet weak var seniorFloppy: UIImageView!
    @IBOutlet weak var plenoFloppy: UIImageView!
    @IBOutlet weak var juniorFloppy: UIImageView!
    @IBOutlet weak var eternalNephewFloppy: UIImageView!
    var questions = [Question]()
    var pointsCounter = ModelSingleton.shared.pointsCounter
    
    
    @IBOutlet weak var computer: UIImageView!
    
    var floppyViewOrigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        addPanGesture(view: eternalNephewFloppy)
        addPanGesture(view: juniorFloppy)
        addPanGesture(view: plenoFloppy)
        addPanGesture(view: seniorFloppy)
        
//        floppyViewOrigin = eternalNephewFloppy.frame.origin
        view.bringSubviewToFront(eternalNephewFloppy)
        view .bringSubviewToFront(juniorFloppy)
        view .bringSubviewToFront(plenoFloppy)
        view .bringSubviewToFront(seniorFloppy)
        
        pointsCounter = 6
        
        if pointsCounter == 6 {
            eternalNephewFloppy.isUserInteractionEnabled = true
            juniorFloppy.isUserInteractionEnabled = true
            plenoFloppy.isUserInteractionEnabled = false
            seniorFloppy.isUserInteractionEnabled = false
            seniorFloppy.alpha = 0.4
        } else if pointsCounter == 12 {
            eternalNephewFloppy.isUserInteractionEnabled = true
            juniorFloppy.isUserInteractionEnabled = true
            plenoFloppy.isUserInteractionEnabled = true
            seniorFloppy.isUserInteractionEnabled = false
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
                } completion: { _ in
                    let level = Charges.Junior
                    self.presentQuiz(level: level)
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
