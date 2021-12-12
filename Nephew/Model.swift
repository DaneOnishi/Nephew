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
    var progressBar = UIProgressView()
    
    let questions = [
        Charges.EternalNephew:
            [
                Question(questions: "Qual configuração de cor devo usar para um post de feice?", answers: ["CMYK", "RGB", "Hexachrome", "Pantone"], correctAnswer: 1),
                Question(questions: "O que é sangria??????", answers: ["Margem de segurança para corte na gráfica", "Bebida apreciada por designers", "Plugin para arte digital", "aiai uiui dodói"], correctAnswer: 0),
                Question(questions: "Devo colocar quanto?", answers: ["0.3mm", "0.5mm", "1.0cm", "Não coloca"], correctAnswer: 3),
                Question(questions: "O que é uma fonte com serifa?", answers: ["arial 12 vermelho fundo preto", "fonte com tracinho", "dificil de ler", "fonte sem traço ou barra como remate"], correctAnswer: 2),
                Question(questions: "Método que posso utilizar para escolher cores?", answers: ["pegar amarelo e azul, eu amo", "utilizar uma paleta de cores análogas", "usar conta gotas em uma foto que voce pegou da internet", "tudo preto e branco, menos trabalho"], correctAnswer: 1),
                Question(questions: "Como posso alinhar os elementos gráficos na tela?", answers: ["pegar uma régua e colocar na frente da tela", "gridar o workspace", "pedir opinião no grupo do zap", "vou deixar assim, é só impressão"], correctAnswer: 1),
                Question(questions: "O que é visibilidade para Norman?", answers: ["Pegar uma foto da net, ninguém vai descobri", "Ir no unsplash e pesquisar sanitary tricot", "Existem elementos que ajudam no consumo e indicação do produto", "conseguir ver o produto"], correctAnswer: 2),
                Question(questions: "O que é radiação para Leborg?", answers: ["Usar formas mais orgânicas, com arremates circulares", "Fazer três quadrados e já é","Estruturas repetitivas em torno de um centro", "TÓXICO"], correctAnswer: 2),
                Question(questions: "E em que formato exportar?", answers: [".png, .jpeg", "Autocad",".mp3", "Exportar todos e mandar um zip pra tia"], correctAnswer: 0),
                Question(questions: "Existe perigo de estragar meu trabalho mandando por", answers: ["Pasta compartilhada na nuvem", "Zap","Pen-drive", "Email"], correctAnswer: 3)
                
            ],
        .Junior:
            [
                Question(questions: "O que eu devo fazer primeiro?", answers: ["Começar desenhando", "Fazer um benchmarking", "Perguntar para o meu mano", "Traçar em cima de alguma do google"], correctAnswer: 1),
                Question(questions: "Que tipo de pessoa frequenta uma loja de shake?", answers: ["Só a galera da academia", "Só a galera que faz dieta", "Criar uma persona para o público alvo", "desenhar um grande shake musculoso"], correctAnswer: 2),
                Question(questions: "Como não começar a definir um estilo?", answers: ["Pesquisa de tendências", "Fazer um moodboard", "Juntar todas as formas o shake e a loja", "Matriz de afinidade"], correctAnswer: 2),
                Question(questions: "Esse tal de gestalt o que é?", answers: ["É estudo da percepção humana em relação as formas","O witcher","Um exercício para designers","Duas linhas três circulo"], correctAnswer: 0),
                Question(questions: "Quero ver como a logo vai ficar aplicada", answers: ["Usar a imaginação","Usar um mockup","Pedir uma opinião para o meu mano","Usar um projetor em um copo de shake"], correctAnswer: 1),
                Question(questions: "Reduzi o logo e ficou feião, por que?", answers: ["Não foram feitas reduções da marca","Usar só a versão criada","Exportar em png, depois em jpeg, depois em autocad","Nem tá ruim assim"], correctAnswer: 0),
                Question(questions: "Qual o nome dado para os rascunhos gerados?", answers: ["Descartes","Backups","Geração de alternativas","photo collage"], correctAnswer: 2),
                Question(questions: "Devo seguir todas as últimas tendências?", answers: ["Sim, passar o resto do dia vendo tiktok","Ir contra todas as tendências","O meu gosto é superior a todos os outros gostos","Uma marca deve ser atemporal e não se deixar levar"], correctAnswer: 3),
                Question(questions: "Pedir opinião do cliente antes de enviar os arquivos finais?", answers: ["Sim, para não mamar o contrato depois","Não, está perfeito, impecável","Jogar num forum da web, \nopinião da web é sempre melhor","Enviar, seja o que quiser ser"], correctAnswer: 0),
                Question(questions: "Qual a melhor forma de mandar o arquivo final?", answers: [".Zap",".CAD",".Metafile","Exportar nos formatos acordados no contrato"], correctAnswer: 3)
                
            ],
        .Pleno:
            [
                Question(questions: "Meu mano me disse que eu preciso colocar um grid na tela, para que serve o grid?", answers: ["Para fazer layouts xadrezinho", "Para distribuir proporcionalmente os elementos gráficos", "Em breve", "Em breve"], correctAnswer: 2),
                Question(questions: "O que são constraints?", answers: ["Em breve", "Em breve", "Em breve", "Em breve"], correctAnswer: 3),
                Question(questions: "De que forma posso representar o status do usuário no sistema?", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "As fotos de bolo não estão carregando na página", answers: ["Converter para um formato mais leve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "Opinião sobre mudar a cor dos botões ao clicar", answers: ["Fornece feedback visual ao usuário","Confude demais","Tem função estética apenas","Pisca pisca pisca"], correctAnswer: 2),
                Question(questions: "Qual a importância de adicionar breadcrumbs na navegação do site?", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 1),
                Question(questions: "De que forma devo conversar com o mano dev?", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "Caso queira fazer um site que funcione em diferentes tipos de tela, qual tipo de preocupação devo ter?", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "Assets prontos como exportar para o mano dev?", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "De que forma entregar para o cliento?", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3)
            ],
        
        .Senior:
            [
                Question(questions: "Chegando em uma nova equipe, o que fazer?", answers: ["cachorro", "rato", "passaro", "mamaco"], correctAnswer: 1),
                Question(questions: "Pediram um projeto de ux research, o que é isso?", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "De que forma devo prosseguir com o café?", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "Em breve", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "Na hora de gerenciar um projeto devo me preocupar com", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "Em caso de desentendimento de design devemos?", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "O que deve ser priorizado em um projeto de UX?", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "De que forma o trabalho em equipe pode ser otimizado?", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
                Question(questions: "É possível administrar xx", answers: ["Em breve","Em breve","Em breve","Em breve"], correctAnswer: 3),
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
    
    func resetProgressBar() {
     progressBar.progress = 0
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

enum Charges: Int {
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
    
    var progressBarRightImage: String {
        switch self {
        case .EternalNephew:
            return "Junior"
        case .Junior:
            return "Pleno"
        case .Pleno:
            return "Senior"
        case .Senior:
            return "Star"
        }
    }
    
    var progressBarLeftImage: String {
        switch self {
        case .EternalNephew:
            return "Eternal-Nephew"
        case .Junior:
            return "Junior"
        case .Pleno:
            return "Pleno"
        case .Senior:
            return "Senior"
        }
    }
}

