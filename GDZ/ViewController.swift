//
//  ViewController.swift
//  GDZ
//
//  Created by Дмитрий on 05.03.2024.
//

import UIKit

class ViewController: UIViewController {

    let testButton: UIButton = .makeButton(text: "test", backgroundColor: .buyButtonColor, stringColor: .viewBackgroundColor)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.viewBackgroundColor
        view.addSubview(testButton)
        testButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            testButton.widthAnchor.constraint(equalToConstant: 200),
            testButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    

}

