//
//  QuestViewController.swift
//  Nephew
//
//  Created by Daniella Onishi on 29/07/21.
//

import UIKit

class QuestViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var questImage: UIImageView!
    @IBOutlet weak var startQuestButton: UIButton!
    
    var questChargeImage = Charges.self
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // questImage.image = UIImage(named: Charges.questImage)
    }
    
    @IBAction func startQuestButtonPressed(_ sender: Any) {
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
