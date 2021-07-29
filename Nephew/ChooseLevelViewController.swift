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
    
    @IBOutlet weak var computer: UIImageView!
    
    var floppyViewOrigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPanGesture(view: eternalNephewFloppy)
        addPanGesture(view: juniorFloppy)
        addPanGesture(view: plenoFloppy)
        addPanGesture(view: seniorFloppy)
        
        floppyViewOrigin = eternalNephewFloppy.frame.origin
        view.bringSubviewToFront(eternalNephewFloppy)
    }
    
    func addPanGesture(view: UIView) {
        let pan =  UIPanGestureRecognizer(target: self, action: #selector(ChooseLevelViewController.handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    func setup(questions: Question) {
        self.questions = [questions]
    }
    
    //    func presentViewOne(question: Question) {
    //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //        guard let quizVC = storyboard.instantiateViewController(identifier: "QuizViewController") as? QuizViewController else {
    //            return
    //        }
    //        quizVC.modalPresentationStyle = .fullScreen
    //        quizVC.setup(questions: question)
    //        present(quizVC, animated: true, completion: nil)
    //    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        let floppyView = sender.view!
        let translation = sender.translation(in: view)
        
        switch sender.state {
        case .began,.changed:
            floppyView.center = CGPoint(x: (floppyView.center.x) + translation.x, y: (floppyView.center.y) + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
        case .ended:
            if floppyView.frame.intersects(computer.frame) {
                UIView.animate(withDuration: 0.3) {
                    self.eternalNephewFloppy.alpha = 0.0
                    //presentViewOne(question: Question)
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.eternalNephewFloppy.frame.origin = self.floppyViewOrigin
                }
            }
        default:
            break
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
