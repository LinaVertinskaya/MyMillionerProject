//
//  GameStrategy.swift
//  MyMillioner
//
//  Created by Лина Вертинская on 1.06.22.
//

import Foundation
import UIKit

protocol Strategy {
    func getNumberQuestion(numberOfQuestion: Int) -> Int
}
