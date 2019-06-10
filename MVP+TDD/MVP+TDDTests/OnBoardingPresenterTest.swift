//
//  OnBoardingPresenterTest.swift
//  MVP+TDDTests
//
//  Created by Андрей Коноплев on 10/06/2019.
//  Copyright © 2019 Андрей Коноплев. All rights reserved.
//

import XCTest
@testable import MVP_TDD

class OnBoardingPresenterTest: XCTestCase {
    var instance: OnBoardingPresenterProtocol!
    
    var view: OnBoardingViewProtocol!
    var  dataSource: [OnBoardingModel] = [OnBoardingModel(image: nil, text: "Test1"), OnBoardingModel(image: nil, text: "Test2"), OnBoardingModel(image: nil, text: "Test3") ]
    
    override func setUp() {
        super.setUp()
        let view = OnBoardingVC()
        self.instance = OnBoardingPresenter(view: view, dataSource: dataSource)
    }
    
    func testPresenterNumberOfEntitiesTest()-> Void {

        XCTAssertEqual(self.dataSource.count, self.instance.numberOfEntities(), "uncorrect data source")
    }
    
    func testCheckTextTest()-> Void {
        for (index, model) in dataSource.enumerated() {
            XCTAssertEqual(model.text, self.instance.itemAt(index: index).text, "Ошибка индекса")
        }
    }
}
