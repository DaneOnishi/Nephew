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
    
    @IBOutlet weak var computer: UIImageView!
    
    var floppyViewOrigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       addPanGesture(view: eternalNephewFloppy)
        floppyViewOrigin = eternalNephewFloppy.frame.origin
        view.bringSubviewToFront(eternalNephewFloppy)
    }
    
    func addPanGesture(view: UIView) {
        let pan =  UIPanGestureRecognizer(target: self, action: #selector(ChooseLevelViewController.handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
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
