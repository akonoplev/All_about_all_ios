//
//  Question.swift
//  realm
//
//  Created by Андрей Коноплев on 12/06/2019.
//  Copyright © 2019 Андрей Коноплев. All rights reserved.
//

import RealmSwift

final class QuestionModel: Object {
    
    override static func primaryKey() -> String? {
        return "id"
    }

    @objc dynamic var id: Int = 0
    @objc dynamic var topicId: Int = 0
    @objc dynamic var question: String?
    @objc dynamic var category: Int = 0
    
   let theme = LinkingObjects(fromType: ThemeModel.self, property: "questionsList")
    
    var answersList = List<AnswerModel>()
    
    convenience init(id: Int, topicId: Int, question: String?, category: Int) {
        self.init()
        self.id = id
        self.topicId = topicId
        self.question = question
        self.category = category
    }
}
