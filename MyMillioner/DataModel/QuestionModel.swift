//
//  QuestionModel.swift
//  MyMillioner
//
//  Created by Лина Вертинская on 1.06.22.
//

import Foundation

struct Question: Codable {
    var question: [ Int:String ] = [
        1:"Куда осенью прячутся бабочки?",
        2:"Что называют тихой охотой?",
        3:"В каком месяце в Австралии начинается осень?",
        4:"Как зовут Деда Мороза на Кипре?"
    ]
    var response: [ Int:[String] ] = [
        1: ["В кору деревьев","В листья","В землю"],
        2: ["Сбор грибов","Охота на оленей","Сбор ягод"],
        3: ["В июне","В мае","В марте"],
        4: ["Дед Мороз","Санта Клаус","Василий"]
    ]
    var trueQuestion: [ Int:Int ] = [
        1:1,2:1,3:3,4:3
    ]
}

