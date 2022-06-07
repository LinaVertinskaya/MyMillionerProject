//
//  GameSession.swift
//  MyMillioner
//
//  Created by Лина Вертинская on 1.06.22.
//


import Foundation
import UIKit

class GameSession {
    var data : Int = 0
    var gameIteration: Observable<Int> = Observable(0)
    var trueAnswer: Int = 0
    var numberQuestion: Int = 0
}

extension GameSession: GameResultDelegate {
    func eventEndGame(result: Int) {
        Game.shared.countTrueResponce?.data = result
        Game.shared.addResult()
    }
}
