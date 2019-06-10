//
//  OnBoardingPresenter.swift
//  MVP+TDD
//
//  Created by Андрей Коноплев on 08/06/2019.
//  Copyright © 2019 Андрей Коноплев. All rights reserved.
//

import Foundation

protocol OnBoardingPresenterProtocol: class {
    func numberOfEntities()-> Int
    func itemAt(index: Int)-> OnBoardingModel
}

class OnBoardingPresenter: OnBoardingPresenterProtocol {
    
    weak var view: OnBoardingViewProtocol!
    
    private var  dataSource: [OnBoardingModel] = [OnBoardingModel(image: nil, text: "Привет нам необходимо изобрести вечный двигатель или мы все умрем"), OnBoardingModel(image: nil, text: "Совершенно точно"), OnBoardingModel(image: nil, text: "Как бы не так") ]
    
    required init(view: OnBoardingViewProtocol, dataSource: [OnBoardingModel]?) {
        self.view = view
        guard let dataSource = dataSource else { return }
        self.dataSource = dataSource
    }
    
    func numberOfEntities() -> Int {
        return dataSource.count
    }
    
    func itemAt(index: Int) -> OnBoardingModel {
        guard index < dataSource.count else { return OnBoardingModel(image: nil, text: "")}
            return dataSource[index]

    }
    
}
