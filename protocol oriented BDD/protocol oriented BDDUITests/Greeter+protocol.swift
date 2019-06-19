//
//  Greeter+protocol.swift
//  protocol oriented BDD
//
//  Created by Андрей Коноплев on 18/06/2019.
//  Copyright © 2019 Андрей Коноплев. All rights reserved.
//

import Foundation

protocol Greetable {
    func testHomeScreenGreetButton()-> Void
    func testUserShouldGetWelcomMessageOnceEnter()-> Void
    
}
