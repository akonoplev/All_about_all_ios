//
//  Greeter+Enum.swift
//  protocol oriented BDDUITests
//
//  Created by Андрей Коноплев on 19/06/2019.
//  Copyright © 2019 Андрей Коноплев. All rights reserved.
//

import XCTest

enum GreeterElements {
    static let greetButton = XCUIApplication().buttons["Привет!"]
    static let greetText = XCUIApplication().staticTexts["Добро пожаловать в Greeter"]
}
