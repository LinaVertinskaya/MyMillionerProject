//
//  GameViewController.swift
//  MyMillioner
//
//  Created by Лина Вертинская on 1.06.22.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var textQuestion: UILabel!
    var delegate : GameResultDelegate?
    var numberQuestion = 0
    var iteration = 0
    var countTrueAnswer : Int = 0
    var gameOver: Bool = false
    let currentSession = Game.shared.dictQuestion!
    var buttons : [UIButton] = []
    var gameScenario: Strategy!
    let currentGame = GameSession()
    let observer = Observer()

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!

    @IBOutlet weak var currentData: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentGame.gameIteration.addObserver(observer, options: [.initial, .new, .old]) { gameIteration, change in

            if change == .new {

                self.textQuestion.text = "Вопрос #\(gameIteration) из \(self.currentSession.question.count)\n" + self.currentSession.question[self.currentGame.numberQuestion]!

                let procent: Float = ((Float(self.currentGame.trueAnswer) / Float(self.currentSession.question.count))) * 100

                self.currentData.text = "Правильные ответы: \(self.currentGame.trueAnswer) - \(procent)%"
                
                for (index,_) in self.buttons.enumerated() {
                    self.buttons[index].setTitle(self.currentSession.response[self.currentGame.numberQuestion]?[index], for: .normal)
                    self.buttons[index].setTitleColor(UIColor.white, for: .normal)
                }
            }
        }

        let backButton = UIBarButtonItem(title: "",
                                         style: .plain,
                                         target: navigationController,
                                         action: nil)
        navigationItem.leftBarButtonItem = backButton

        Game.shared.countQuestion = currentSession.question.count

        countTrueAnswer = 0
        gameOver = false

        self.delegate = GameSession()
        startGameScreen()
    }

    func startGameScreen() {

        buttons.append(button1)
        buttons.append(button2)
        buttons.append(button3)

        if Game.shared.statusRandomQuestion {
            gameScenario = GameRandom()
        } else {
            gameScenario = GameStepToStep()
        }
        numberQuestion = gameScenario.getNumberQuestion(numberOfQuestion: numberQuestion)

        currentGame.numberQuestion = numberQuestion
        currentGame.gameIteration.value = iteration + 1
        buttonTarget(isTarget: true)
    }

    func getNewQuestion(numberOfQuestion: Int, iteration: Int) {
        textQuestion.text = "Вопрос #\(iteration)\n" + currentSession.question[numberQuestion]!
        for (index,_) in buttons.enumerated() {
            buttons[index].setTitle(currentSession.response[numberQuestion]?[index], for: .normal)
            buttons[index].setTitleColor(UIColor.white, for: .normal)
        }
    }

    func buttonTarget(isTarget: Bool) {
        for (index,_) in buttons.enumerated() {
            if isTarget {
                buttons[index].addTarget(self, action: #selector(answer(_:)), for: .touchUpInside)
            } else {
                buttons[index].removeTarget(self, action: #selector(answer(_:)), for: .touchUpInside)
            }
            buttons[index].tag = index + 1
        }
    }

    @objc func answer(_ sender: UIButton) {

        let dispatchGroup = DispatchGroup()

        DispatchQueue.main.async(group: dispatchGroup) {

            if self.currentSession.trueQuestion[self.numberQuestion] == sender.tag {
                sender.setTitleColor(UIColor.green, for: .normal)
                self.countTrueAnswer += 1
            } else {
                sender.setTitleColor(UIColor.red, for: .normal)
                self.gameOver = true
            }
            self.iteration += 1
            self.numberQuestion = self.gameScenario.getNumberQuestion(numberOfQuestion: self.numberQuestion)

        }
        dispatchGroup.notify(queue: DispatchQueue.main) {
            sleep(1)

            if (self.iteration < self.currentSession.question.count) && (self.gameOver != true) {

                self.currentGame.trueAnswer = self.countTrueAnswer
                self.currentGame.numberQuestion = self.numberQuestion
                self.currentGame.gameIteration.value = self.iteration + 1

            } else {
                self.buttonTarget(isTarget: false)
                self.delegate?.eventEndGame(result: self.countTrueAnswer)
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }

}

