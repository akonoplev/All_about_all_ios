//
//  ExamModel.swift
//  Base+realm
//
//  Created by Андрей Коноплев on 12/06/2019.
//  Copyright © 2019 Андрей Коноплев. All rights reserved.
//

import Foundation

class ExamModel {
    
    let mode: String?
    let allQuestion: [QuestionModel]
    
    var date: Date = Date()
    var time: Double = 0.0
    var success: Bool
    
    private var rightQiestion: [(QuestionModel, AnswerModel)] = [(QuestionModel, AnswerModel)]()
    private var wrongQuestion: [(QuestionModel, AnswerModel)] = [(QuestionModel, AnswerModel)]()
    
    var percent: Int
}
