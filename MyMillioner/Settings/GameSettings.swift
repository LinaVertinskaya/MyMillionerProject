//
//  GameSetting.swift
//  MyMillioner
//
//  Created by Лина Вертинская on 1.06.22.
//

import Foundation

class GameSettings {
    var status : Bool = false
}

extension GameSettings: GameSettingsDelegate {
    func eventChangeSettings(statusRandom: Bool) {
        Game.shared.randomQuestion?.status = statusRandom
        Game.shared.addRandomState()
    }
}

