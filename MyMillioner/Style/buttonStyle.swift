//
//  buttonStyle.swift
//  MyMillioner
//
//  Created by Лина Вертинская on 1.06.22.
//

import UIKit

final class buttonStyle: UIButton {

        override func draw(_ rect: CGRect) {
            super.draw(rect)

            layer.cornerRadius = 10
            layer.masksToBounds = true
        }
}
