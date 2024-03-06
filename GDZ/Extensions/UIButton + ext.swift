//
//  UIButton + ext.swift
//  GDZ
//
//  Created by Дмитрий on 05.03.2024.
//

import UIKit

extension UIButton {
    static func makeButton(
        text: String,
        backgroundColor: UIColor,
        stringColor: UIColor
    ) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.layer.cornerRadius = 12
        button.setTitleColor(stringColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "sf-ui-text-bold", size: 11)
        button.backgroundColor = backgroundColor
        return button
    }
}
