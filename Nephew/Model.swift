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
                Question(questions: "O que eu devo fazer primeiro?", answers: ["Começar desenhando", "Fazer um benchmarking", "Perguntar para o meu mano", "Traçar em cima de alguma do google"], correctAnswer: 1),
                Question(questions: "Que tipo de pessoa frequenta uma loja de shake?", answers: ["Só a galera da academia", "Só a galera que faz dieta", "Criar uma persona para o público alvo", "desenhar um grande shake musculoso"], correctAnswer: 2),
                Question(questions: "Como transmitir a vibe loja de shakes no logo", answers: ["Pesquisa de tendências", "Fazer um moodboard", "Juntar todas as formas o shake e a loja", "teste"], correctAnswer: 2),
                Question(questions: "Esse tal de gestalt o que é?", answers: ["","","",""], correctAnswer: 3),
                Question(questions: "Quero ver como a logo vai ficar aplicada", answers: ["","","",""], correctAnswer: 2),
                Question(questions: "Reduzi o logo e ficou feião, por que?", answers: ["","","",""], correctAnswer: 3),
                Question(questions: "Beleza, vou ter que refazer, como?", answers: ["","","",""], correctAnswer: 3),
                Question(questions: "", answers: ["","","",""], correctAnswer: 3),
                Question(questions: "", answers: ["","","",""], correctAnswer: 3),
                Question(questions: "", answers: ["","","",""], correctAnswer: 3)
                
            ],
        .Pleno:
            [
                Question(questions: "Meu mano me disse que eu preciso colocar um grid na tela, para que serve o grid?", answers: ["cortar", "abrir", "trazer", "mapear"], correctAnswer: 3),
                Question(questions: "O que são constraints?", answers: ["sim", "nao", "true", "fake"], correctAnswer: 3),
                Question(questions: "De que forma posso representar o status do usuário no sistema?", answers: ["","","",""], correctAnswer: 1),
                Question(questions: "As fotos de bolo não estão carregando na página", answers: ["","","",""], correctAnswer: 1),
                Question(questions: "", answers: ["","","",""], correctAnswer: 2),
                Question(questions: "", answers: ["","","",""], correctAnswer: 1),
                Question(questions: "", answers: ["","","",""], correctAnswer: 3),
                Question(questions: "", answers: ["","","",""], correctAnswer: 3),
                Question(questions: "", answers: ["","","",""], correctAnswer: 3),
                Question(questions: "", answers: ["","","",""], correctAnswer: 3)
            ],
        
        .Senior:
            [
                Question(questions: "Se voce fosse rato", answers: ["cachorro", "rato", "passaro", "mamaco"], correctAnswer: 1),
                Question(questions: "", answers: ["","","",""], correctAnswer: 3),
                Question(questions: "", answers: ["","","",""], correctAnswer: 3),
                Question(questions: "", answers: ["","","",""], correctAnswer: 3),
                Question(questions: "", answers: ["","","",""], correctAnswer: 3),
                Question(questions: "", answers: ["","","",""], correctAnswer: 3),
                Question(questions: "", answers: ["","","",""], correctAnswer: 3),
                Question(questions: "", answers: ["","","",""], correctAnswer: 3),
                Question(questions: "", answers: ["","","",""], correctAnswer: 3),
                Question(questions: "", answers: ["","","",""], correctAnswer: 3),
                Question(questions: "", answers: ["","","",""], correctAnswer: 3)
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

