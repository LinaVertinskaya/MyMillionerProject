//
//  NewRequestModel.swift
//  MyMillioner
//
//  Created by Лина Вертинская on 1.06.22.
//

import Foundation

class GameNewRequest: GameDictonaryDelegate {
    func eventNewRequest(data: Question) {
        Game.shared.dictQuestion = data
    }
}

