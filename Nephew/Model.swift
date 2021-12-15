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
                Question(questions: "O que é um manual da marca?", answers: ["Instruções de como vender a marca","Instruções de como usar a marca","Como aplicar a marca manualmente","Canal da internet para experimentações"], correctAnswer: 1),
                Question(questions: "Qual a vantagem de se possuir um?", answers: ["Passar a palavra para outros designers","Servir como receita para outras marcas","Padronizar as aplicações da marca","Exportar nos formatos acordados no contrato"], correctAnswer: 2)
                
            ],
        .Pleno:
            [
                Question(questions: "Meu mano me disse que eu preciso colocar um grid na tela, para que serve o grid?", answers: ["Para fazer layouts xadrezinho", "Para distribuir proporcionalmente os elementos gráficos", "Para marcar encontros", "É uma linguagem de programação"], correctAnswer: 2),
                Question(questions: "O que são constraints?", answers: ["São limites na dimensão dos elementos", "Design entupido", "São limites à criatividade", "Bloqueio criativo"], correctAnswer: 0),
                Question(questions: "De que forma posso representar o status do usuário no sistema?", answers: ["loader spinner","Breadcrumb","Todas","Skeleton"], correctAnswer: 2),
                Question(questions: "As fotos de bolo não estão carregando na página", answers: ["Converter para um formato mais leve","Tirar novas fotos de bolos","Desenhar as fotos de bolos","O bolo é surpresa"], correctAnswer: 0),
                Question(questions: "Opinião sobre mudar a cor dos botões ao clicar", answers: ["Fornece feedback visual ao usuário","Confude demais","Tem função estética apenas","Pisca pisca pisca"], correctAnswer: 0),
                Question(questions: "Qual a importância de adicionar breadcrumbs na navegação do site?", answers: ["Mapear migalhas","Função estética","Status do usuário no sistema","Mostrar que é site de comida"], correctAnswer: 2),
                Question(questions: "Por que caixas de confirmação são importantes?", answers: ["Para prevenir erros do usuário","Para atrapalhar a navegação","Para tapar áreas feias","Para confundir"], correctAnswer: 0),
                Question(questions: "Caso queira fazer um site que funcione em diferentes tipos de tela, qual tipo de preocupação devo ter?", answers: ["Botões .png, backgrounds .png","Criar um layout responsivo","Nenhuma, tudo funciona perfect","Problema é do dev"], correctAnswer: 1),
                Question(questions: "Assets prontos, como exportar para o mano dev?", answers: [".CAD",".svg",".metafile",".print"], correctAnswer: 3),
                Question(questions: "O que é um Design System?", answers: ["Redes neurais artistas","Uma banda de designers","Unificação do estilo de um produto","Tutorial de design"], correctAnswer: 2)
            ],
        
        .Senior:
            [
                Question(questions: "O que significa MVP?", answers: ["Projeto barato", "Multiplos Variaveis de Produtos", "Produto Minimamente Viável", "Macaco Vai Pegar"], correctAnswer: 2),
                Question(questions: "E para que serve?", answers: ["Testar a ideia com o menor investimento","Dar abrigo para macacos","Multiplicar investimentos","Menos por mais"], correctAnswer: 0),
                Question(questions: "UX Researcher é o responsável por?", answers: ["Fechar o briefing","Procurar usuários","Investigar usuários","Buscar por UX na net"], correctAnswer: 2),
                Question(questions: "Design thinking é o processo de", answers: ["resolver problemas com foco em pessoas","Pensar em design o dia todo","Postergar o trabalho","Resolver problemas mentalmente"], correctAnswer: 0),
                Question(questions: "Na hora de gerenciar um projeto devo me preocupar com", answers: ["Prazos","Etapas","Todas","Contato com o cliente"], correctAnswer: 2),
                Question(questions: "Como aproximar o usuário do design?", answers: ["Entrevistas","Testagens","Pesquisas Etnográficas","Todas"], correctAnswer: 3),
                Question(questions: "O que deve ser priorizado em um projeto de UX?", answers: ["O cliente","A empresa","O usuário","Os grafismos"], correctAnswer: 2),
                Question(questions: "O que é uma sprint", answers: ["Task a ser cumprida em X tempo","Refri","Tacada de golfe","Design de rótulo"], correctAnswer: 0),
                Question(questions: "Qual destes não pertence ao processo de design thinking?", answers: ["Definir","Implementar","Simpatizar","Idealizar"], correctAnswer: 2),
                Question(questions: "O que é churn?", answers: ["Perda de usuários","Comida com milho","Rodapé de site","Rescisão da equipe toda"], correctAnswer: 0),
                Question(questions: "Qual é o segredo do design?", answers: ["Hate","Lollipop","Passion","Peace"], correctAnswer: 2)
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

