//
//  AnswerModel.swift
//  Base+realm
//
//  Created by Андрей Коноплев on 12/06/2019.
//  Copyright © 2019 Андрей Коноплев. All rights reserved.
//

import Foundation
import RealmSwift

class AnswerModel: Object {
    
    @objc dynamic var text: String?
    @objc dynamic var isCorrect: Bool = false
    
    let theme = LinkingObjects(fromType: QuestionModel.self, property: "answersList")
    
    convenience init(text: String?, isCorrect: Bool) {
        self.init()
        self.text = text
        self.isCorrect = isCorrect
    }
    
}
