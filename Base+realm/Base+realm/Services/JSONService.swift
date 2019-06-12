//
//  JSONService.swift
//  realm
//
//  Created by Андрей Коноплев on 12/06/2019.
//  Copyright © 2019 Андрей Коноплев. All rights reserved.
//

import Foundation
import RealmSwift

public enum JSONFilename: String {
    case securityQuestion = "Question"
    case securityThems = "Themes"
}

class ParseJSONService {
    
    fileprivate class func parseJsonFromFile(fileName: JSONFilename)-> Data? {
        if let url = Bundle.main.url(forResource: fileName.rawValue, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                return data
            } catch {
                print("data Error")
                return nil
            }
        }
        return nil
    }
    
    class func parseThemes(db: Realm?)-> Void {
        
        if let jsonData = parseJsonFromFile(fileName: .securityThems) {
            do {
                if let json = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray {
                    json.forEach { (model) in
                        if let model = model as? Dictionary<String, Any> {
                            let id = model["id"] as? Int
                            let name = model["name"] as? String
                            guard let uId = id else { return }

                            try! db?.write {
                                let theme = ThemeModel(id: uId, name: name)
                                db?.add(theme, update: true)
                            }
                        }
                    }
                }
            } catch {
                print("failed load data")
            }
        }
    }
    
    class func parseQuestion(db: Realm?)-> Void {
        if let jsonData = parseJsonFromFile(fileName: .securityQuestion) {
            do {
                if let json = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray {
                    json.forEach { (model) in
                        if let model = model as? Dictionary<String, Any> {
                            
                            let id = model["id"] as? Int
                            let topicId = model["topicId"] as? Int
                            let question = model["question"] as? String
                            let category = model["category"] as? Int
                            
                            let theme = db?.object(ofType: ThemeModel.self, forPrimaryKey: topicId ?? 0)
                            let questionModel = QuestionModel(id: id ?? 0, topicId: topicId ?? 0, question: question, category: category ?? 0)
                            
                            try! db?.write {
                                theme?.questionsList.append(questionModel)
                            }
                            
                            //add anwers
                            if let answers = model["answers"] as? NSArray {
                                answers.forEach({  (answer) in
                                    if let answer = answer as? Dictionary<String, Any> {
                                        let text = answer["text"] as? String
                                        let isCorrect = answer["isCorrect"] as? Bool ?? false
                                        
                                        try! db?.write {
                                            let answerModel = AnswerModel(text: text, isCorrect: isCorrect)
                                            questionModel.answersList.append(answerModel)
                                            
                                        }
                                    }
                                })
                            }
                            
                        }
                    }
                }
            } catch {
                print("failed load data")
            }
        }
    }
    
//    class func parseThems()-> [ThemModel] {
//        guard let data = parseJsonFromFile(fileName: .securityThems) else { return [ThemModel]() }
//        let decoder = JSONDecoder()
//        do {
//            let thems = try decoder.decode([ThemModel].self, from: data)
//            return thems
//        } catch {
//            print("Parsing thems Error")
//        }
//        return [ThemModel]()
//    }
//    
//    class func parseQuestion()-> [QuestionModel] {
//        guard let data = parseJsonFromFile(fileName: .securityQuestion) else { return [QuestionModel]() }
//        let decoder = JSONDecoder()
//        do {
//            let question = try decoder.decode([QuestionModel].self, from: data)
//            return question
//        } catch {
//            print("Parsing question Error")
//        }
//        return [QuestionModel]()
//    }
}
