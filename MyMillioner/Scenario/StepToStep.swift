//
//  StepToStep.swift
//  MyMillioner
//
//  Created by Лина Вертинская on 1.06.22.
//

import Foundation
import UIKit

class GameStepToStep: Strategy {
    func getNumberQuestion(numberOfQuestion: Int) -> Int {
        return numberOfQuestion + 1
    }
}

