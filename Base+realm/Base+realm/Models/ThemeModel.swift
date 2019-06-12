//
//  Theme.swift
//  realm
//
//  Created by Андрей Коноплев on 12/06/2019.
//  Copyright © 2019 Андрей Коноплев. All rights reserved.
//

import Foundation
import RealmSwift

final class ThemeModel: Object {

    override static func primaryKey() -> String? {
        return "id"
    }
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String?
    var questionsList = List<QuestionModel>()
    
    convenience init(id: Int, name: String?) {
        self.init()
        self.id = id
        self.name = name
    }
    
}
