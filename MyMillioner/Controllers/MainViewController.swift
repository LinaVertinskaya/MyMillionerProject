//
//  MainViewController.swift
//  MyMillioner
//
//  Created by Лина Вертинская on 1.06.22.
//

import UIKit

final class MainViewController: UIViewController {
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "goGame":
            Game.shared.countTrueResponce = GameSession()
        default:
            break
        }
    }

}
