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
    var currentCharge: Charges?
    var questionNumber = Int()
    
    let questions = [
        Charges.EternalNephew:
            [
                Question(questions: "hmmm abrir arquivo... onde que eu? ata abriu...\nQual configuração de cor devo usar para um post de feice?", answers: ["CMYK", "RGB", "Hexachrome", "Pantone"], correctAnswer: 1),
                Question(questions: "O que é sangria?????? Devo colocar quanto?", answers: ["0.3mm", "0.5mm", "1.0cm", "Não coloca"], correctAnswer: 3),
                Question(questions: "Como que diminui a fonte????????????? /nMeu brother disse que para web o melhor é usar fonte sem serifa \nO que isso significa?", answers: ["arial 12 vermelho fundo preto", "fonte com tracinho", "dificil de ler", "fonte sem traço ou barra como remate"], correctAnswer: 2),
                Question(questions: "Vou pegar amarelo e azul, eu amo", answers: ["pegar amarelo e azul, eu amo", "utilizar uma paleta de cores análogas", "usar conta gotas em uma foto que voce pegou da internet", "tudo preto e branco, menos trabalho"], correctAnswer: 1),
                Question(questions: "Hm, alguma coisa ta meio esquisita, tudo meio torto", answers: ["pegar uma régua e colocar na frente da tela", "gridar o workspace", "pedir opinião no grupo do zap", "vou deixar assim, é só impressão"], correctAnswer: 1),
                Question(questions: "A tia não tem nenhuma foto legal do trico", answers: ["Pegar uma foto da net, ninguém vai descobri", "Ir no unsplash e pesquisar sanitary tricot", "Pedir uma foto pra tia e editar po", "faz sem foto mesmo"], correctAnswer: 2),
                Question(questions: "Talvez eu seja acusado de plágio, parece que copiar outros posts não está dando certo", answers: ["A mano tá na net é pra pega", "Mudar uns detalhezinhos","tia não vai dar pra fazer", "Fazer uma coleta e análise de similares"], correctAnswer: 3),
                Question(questions: "Se eu quiser passar uma vibe mais leve?", answers: ["Usar formas mais orgânicas, com arremates circulares", "Fazer três quadrados e já é","Tudo transparente", "Fotos de salada no fundo"], correctAnswer: 0),
                Question(questions: "Tudo quase pronto, em que formato exportar?", answers: [".png, .jpeg", "Autocad",".mp3", "Exportar todos e mandar um zip pra tia"], correctAnswer: 0),
                Question(questions: "Existe perigo de estragar meu trabalho mandando por", answers: ["Pasta compartilhada na nuvem", "Zap","Pen-drive", "Email"], correctAnswer: 3),
                
            ],
        .Junior:
            [
                Question(questions: "O que eu devo fazer primeiro?", answers: ["Começar desenhando", "Fazer um benchmarking", "Perguntar para o meu mano", "Traçar em cima de alguma do google"], correctAnswer: 1),
                Question(questions: "Que tipo de pessoa frequenta uma loja de shake?", answers: ["Só a galera da academia", "Só a galera que faz dieta", "Criar uma persona para o público alvo", "desenhar um grande shake musculoso"], correctAnswer: 2),
                Question(questions: "Como transmitir a vibe loja de shakes no logo", answers: ["Pesquisa de tendências", "Fazer um moodboard", "Juntar todas as formas o shake e a loja", "teste"], correctAnswer: 2),
                Question(questions: "Esse tal de gestalt o que é?", answers: ["É estudo da percepção humana em relação as formas","O witcher","Um exercício para designers","Duas linhas três circulo"], correctAnswer: 3),
                Question(questions: "Quero ver como a logo vai ficar aplicada", answers: ["Usar a imaginação","Usar um mockup","Pedir uma opinião para o meu mano","Usar um projetor em um copo de shake"], correctAnswer: 1),
                Question(questions: "Reduzi o logo e ficou feião, por que?", answers: ["Não foram feitas reduções da marca","Usar só a versão criada","Exportar em png, depois em jpeg, depois em autocad","Nem tá ruim assim"], correctAnswer: 0),
                Question(questions: "Bora refazer, como?", answers: ["Pegar o que foi criado e comeaçar uma GA","Ir numa loja de shake e copiar o logo com papel vegetal","Abandonar o freela","dois circulo duas linhas"], correctAnswer: 0),
                Question(questions: "Devo seguir todas as últimas tendências?", answers: ["Sim, passar o resto do dia vendo tiktok","Ir contra todas as tendências","O meu gosto é superior a todos os outros gostos","Uma marca deve ser atemporal e não se deixar levar"], correctAnswer: 3),
                Question(questions: "Pedir opinião do cliente antes de enviar os arquivos finais?", answers: ["Sim, para não mamar o contrato depois","Não, está perfeito, impecável","Jogar num forum da web, \nopinião da web é sempre melhor","Enviar, seja o que quiser ser"], correctAnswer: 0),
                Question(questions: "Qual a melhor forma de mandar o arquivo final?", answers: [".Zap",".CAD",".Metafile","Exportar nos formatos acordados no contrato"], correctAnswer: 3)
                
            ],
        .Pleno:
            [
                Question(questions: "Meu mano me disse que eu preciso colocar um grid na tela, para que serve o grid?", answers: ["Para fazer layouts xadrezinho", "Para distribuir proporcionalmente os elementos gráficos", "Em breve", "Em breve"], correctAnswer: 2),
                Question(questions: "O que são constraints?", answers: ["Em breve", "Em breve", "Em breve", "Em breve"], correctAnswer: 3),
                Question(questions: "De que forma posso representar o status do usuário no sistema?", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "As fotos de bolo não estão carregando na página", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "Em breve", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 2),
                Question(questions: "Em breve", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 1),
                Question(questions: "Em breve", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3)
            ],
        
        .Senior:
            [
                Question(questions: "Se voce fosse rato", answers: ["cachorro", "rato", "passaro", "mamaco"], correctAnswer: 1),
                Question(questions: "Em breve", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "Em breve", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "Em breve", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "Em breve", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "Em breve", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "Em breve", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "Em breve", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "Em breve", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "Em breve", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "Em breve", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3)
            ]
    ]
    
    var unlockedCharges: [Charges: Bool] = [
        .EternalNephew: true,
        .Junior: false,
        .Pleno: false,
        .Senior: false]
    
    func scoreSum() {
        pointsCounter += 1
    }
    
    enum Answer {
        case correct
        case incorrect
    }

    func unlockCharges(charges: Charges) {
        unlockedCharges[charges] = true
    }
    
    func resetQuiz() {
        pointsCounter = 0
        currentCharge = nil 
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
            return "Quest-One-Card"
        case .Junior:
            return "Quest-Two-Card"
        case .Pleno:
            return "Quest-Three-Card"
        case .Senior:
            return "Quest-Four-Card"
        }
    }
    
    var congratsImage: String {
        switch self {
        case .EternalNephew:
            return "Quest-One-Good-Ending"
        case .Junior:
            return "Quest-Two-Good-Ending"
        case .Pleno:
            return "Quest-Three-Good-Ending"
        case .Senior:
            return "Quest-Four-Good-Ending"
        }
    }
    
    var defeatImage: String {
        switch self {
        case .EternalNephew:
            return "Quest-One-Bad-Ending"
        case .Junior:
            return "Quest-Two-Bad-Ending"
        case .Pleno:
            return "Quest-Three-Bad-Ending"
        case .Senior:
            return "Quest-Four-Bad-Ending"
        }
    }
    
    var congratsPhrase: String {
        switch self {
        case .EternalNephew:
            return "Amazing"
        case .Junior:
            return "RAD"
        case .Pleno:
            return "LIT"
        case .Senior:
            return "SOLID"
        }
    }
    
    var defeatPhrase: String {
        switch self {
        case .EternalNephew:
            return "Meh"
        case .Junior:
            return "disgusting"
        case .Pleno:
            return "cringer"
        case .Senior:
            return "pleasegoaway"
        }
    }
    
    var minimumScoreToNextLevel: Int {
        switch self {
        case .EternalNephew:
            return 6
        case .Junior:
            return 6
        case .Pleno:
            return 6
        case .Senior:
            return 6
        }
    }
    
    var nextCharge: Charges? {
        switch self {
        case .EternalNephew:
            return .Junior
        case .Junior:
            return .Pleno
        case .Pleno:
            return .Senior
        case .Senior:
            return nil
       
        }
    }
}

