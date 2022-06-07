//
//  GameResult.swift
//  MyMillioner
//
//  Created by Лина Вертинская on 1.06.22.
//

import Foundation

protocol GameResultDelegate: class {
    func eventEndGame(result: Int)
}
