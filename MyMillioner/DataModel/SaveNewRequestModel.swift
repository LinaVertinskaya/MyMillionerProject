//
//  SaveNewRequestModel.swift
//  MyMillioner
//
//  Created by Лина Вертинская on 1.06.22.
//

import Foundation

class GameSaveDictonary: GameSaveDictonaryDelegate {
    func eventSaveNewRequest() {
        Game.shared.saveNewDictonary()
    }
}
