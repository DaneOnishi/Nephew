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
    var questionNumber = Int()
    
    let questions = [
        Charges.EternalNephew:
            [
                Question(questions: "fome", answers: ["burg", "hamster", "enzo", "rinite"], correctAnswer: 2),
                Question(questions: "fome", answers: ["burg", "hamster", "enzo", "rinite"], correctAnswer: 2),
                Question(questions: "fome", answers: ["burg", "hamster", "enzo", "rinite"], correctAnswer: 2)
                
            ],
        .Junior:
            [
                Question(questions: "fome", answers: ["burg", "hamster", "enzo", "rinite"], correctAnswer: 2),
                Question(questions: "fome", answers: ["burg", "hamster", "enzo", "rinite"], correctAnswer: 2)
            ]
    ]

    func scoreSum() {
        pointsCounter += 1
    }
    
    
    enum Answer {
        case correct
        case incorrect
    }
}

enum Charges {
    case Senior
    case Pleno
    case Junior
    case EternalNephew
}

