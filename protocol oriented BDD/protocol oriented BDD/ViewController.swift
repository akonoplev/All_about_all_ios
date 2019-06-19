//
//  ViewController.swift
//  protocol oriented BDD
//
//  Created by Андрей Коноплев on 18/06/2019.
//  Copyright © 2019 Андрей Коноплев. All rights reserved.
//

//Protocol oriented BDD (UI Tests)

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var greetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton()
        button.setTitle("Привет!", for: .normal)
        button.frame.origin = CGPoint(x: (UIScreen.main.bounds.width / 2) - 50, y: UIScreen.main.bounds.height / 2)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.5
        button.frame.size = CGSize(width: 100, height: 30)
        button.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(showGreetView), for: .touchUpInside)
    }
    
    @objc func showGreetView() {
        greetLabel.text = "Добро пожаловать в Greeter"
    }


}

