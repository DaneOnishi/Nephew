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
                Question(questions: "hmmm abrir arquivo... onde que eu? ata abriu...\nQual configuração de cor devo usar para um post de feice?", answers: ["CMYK", "RGB", "Hexachrome", "Pantone"], correctAnswer: 1),
                Question(questions: "O que é sangria?????? Devo colocar quanto?", answers: ["0.3mm", "0.5mm", "1.0cm", "Não coloca"], correctAnswer: 3),
                Question(questions: "Como que diminui a fonte????????????? /nMeu brother disse que para web o melhor é usar fonte sem serifa \nO que isso significa?", answers: ["burg", "hamster", "enzo", "rinite"], correctAnswer: 2),
                Question(questions: "Vou pegar amarelo e azul, eu amo", answers: ["pegar amarelo e azul, eu amo", "utilizar uma paleta de cores análogas", "usar conta gotas em uma foto que voce pegou da internet", "tudo preto e branco, menos trabalho"], correctAnswer: 1),
                Question(questions: "Hm, alguma coisa ta meio esquisita, tudo meio torto", answers: ["pegar uma régua e colocar na frente da tela", "gridar o workspace", "pedir opinião no grupo do zap", "vou deixar assim, é só impressão"], correctAnswer: 1),
                Question(questions: "A tia não tem nenhuma foto legal do trico", answers: ["Pegar uma foto da net, ninguém vai descobri", "Ir no unsplash e pesquisar sanitary tricot", "Pedir uma foto pra tia e editar po", "faz sem foto mesmo"], correctAnswer: 2),
                Question(questions: "Talvez eu seja acusado de plágio, parece que copiar outros posts não está dando certo", answers: ["A mano tá na net é pra pega", "Mudar uns detalhezinhos","tia não vai dar pra fazer", "Fazer uma coleta e análise de similares"], correctAnswer: 3),
                Question(questions: "Talvez eu seja acusado de plágio, parece que copiar outros posts não está dando certo", answers: ["A mano tá na net é pra pega", "Mudar uns detalhezinhos","tia não vai dar pra fazer", "Fazer uma coleta e análise de similares"], correctAnswer: 3),
                Question(questions: "Talvez eu seja acusado de plágio, parece que copiar outros posts não está dando certo", answers: ["A mano tá na net é pra pega", "Mudar uns detalhezinhos","tia não vai dar pra fazer", "Fazer uma coleta e análise de similares"], correctAnswer: 3),
                Question(questions: "Talvez eu seja acusado de plágio, parece que copiar outros posts não está dando certo", answers: ["A mano tá na net é pra pega", "Mudar uns detalhezinhos","tia não vai dar pra fazer", "Fazer uma coleta e análise de similares"], correctAnswer: 3),
                
            ],
        .Junior:
            [
                Question(questions: "Teste 1", answers: ["teste", "teste", "teste", "teste"], correctAnswer: 2),
                Question(questions: "Teste 2", answers: ["teste", "teste", "teste", "teste"], correctAnswer: 2)
            ],
        .Pleno:
            [
                Question(questions: "Qual o primeiro passo", answers: ["cortar", "abrir", "trazer", "mapear"], correctAnswer: 3),
                Question(questions: "hm biscoito", answers: ["sim", "nao", "true", "fake"], correctAnswer: 3)
            ],
        
        .Senior:
            [
                Question(questions: "Se voce fosse rato", answers: ["cachorro", "rato", "passaro", "mamaco"], correctAnswer: 1)
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

class QuestGiven {
    internal init(questImage: String, text: String){
        self.questImage = questImage
        self.text = text
   }
    var questImage: String
    var text: String
}

enum Charges {
    case Senior
    case Pleno
    case Junior
    case EternalNephew
    
    var questImage: String {
        switch self {
        case .EternalNephew:
            return "Quest-One"
        case .Junior:
            return "Quest-Two"
        case .Pleno:
            return "Quest Three"
        case .Senior:
            return "Quest Four"
        default:
            return "Quest-Zero"
        }
    }
    
}

