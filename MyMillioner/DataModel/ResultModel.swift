//
//  ResultModel.swift
//  MyMillioner
//
//  Created by Лина Вертинская on 1.06.22.
//

import Foundation

struct ResultOfGame: Codable {
    var dateGame: String
    var score: Int
    var procent: Double
    var countRequest: Int
}

