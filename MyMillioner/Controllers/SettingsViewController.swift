//
//  SettingsViewController.swift
//  MyMillioner
//
//  Created by Лина Вертинская on 1.06.22.
//

import UIKit

class SettingsViewController: UIViewController {
    var switchState: Bool = false
    var delegate: GameSettingsDelegate?
    
    @IBOutlet weak var switchControl: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = GameSettings()
        self.switchControl.isOn = Game.shared.statusRandomQuestion

    }

    @IBAction func switchChange(_ sender: UISwitch) {
        DispatchQueue.main.async {
            [weak self] in self?.delegate?.eventChangeSettings(statusRandom: sender.isOn)
        }
    }

}
