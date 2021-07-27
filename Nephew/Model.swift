//
//  Model.swift
//  Nephew
//
//  Created by Daniella Onishi on 27/07/21.
//

import Foundation
import UIKit

class ModelSingleton {
    static let shared = ModelSingleton()
    private init() {}
    
    var pointsCounter = 0
  
    
    func scoreSum() {
        pointsCounter += 1
    }
    
    
    struct Question {
        var Questions: String
        var Answers: [String]
        var correctAnswer: Int
    }
    
    
    enum Answer {
        case correct
        case incorrect
    }
    
    enum Charges {
        case Senior
        case Pleno
        case Junior
        case EternalNephew
    }
}

