//
//  protocol_oriented_BDDUITests.swift
//  protocol oriented BDDUITests
//
//  Created by Андрей Коноплев on 18/06/2019.
//  Copyright © 2019 Андрей Коноплев. All rights reserved.
//

import XCTest

class protocol_oriented_BDDUITests: XCTestCase, Greetable {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()

    }

    override func tearDown() {

    }
    
    func testHomeScreenGreetButton() {
        givenTheAppIsLauched()
        thenIsShouldSeeGreetButton()
        
    }
    
    func testUserShouldGetWelcomMessageOnceEnter() {
        givenTheAppIsLauched()
        whenITapGreetButton()
        thenIShouldSeeGreetMessage()
    }

    func testExample() {

    }

}
