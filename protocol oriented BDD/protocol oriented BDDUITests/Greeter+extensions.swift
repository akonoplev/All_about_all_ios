//
//  Greeter+extensions.swift
//  protocol oriented BDDUITests
//
//  Created by Андрей Коноплев on 18/06/2019.
//  Copyright © 2019 Андрей Коноплев. All rights reserved.
//

import XCTest

extension Greetable {
    func givenTheAppIsLauched() {
        XCUIApplication().launch()
    }
    
    func thenIsShouldSeeGreetButton() {
        XCTAssertTrue(GreeterElements.greetButton.exists, "Кнопка отсутствует")
    }
    
    func whenITapGreetButton() {
        GreeterElements.greetButton.tap()
    }
    
    func thenIShouldSeeGreetMessage() {
        XCTAssertTrue(GreeterElements.greetText.exists, "Нету приветственного текста")
    }
}
