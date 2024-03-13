//
//  TabBarContoller.swift
//  GDZ
//
//  Created by Дмитрий on 07.03.2024.
//

import UIKit

private struct TabBarConstants {
    static let bookImage = UIImage(named: "Books")
    static let myBooksImage = UIImage(named: "BookWithBookmark")
    static let favoritesImage = UIImage(named: "BookMark")
    static let searchImage = UIImage(named: "Search")
}

final class TabBarContoller: UITabBarController {

        override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBarAppearance()
    }

    private func configureTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .tabBarBackgroundColor
        appearance.stackedLayoutAppearance.normal.iconColor = .label
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.label]
        tabBar.scrollEdgeAppearance = appearance
        tabBar.tintColor = .buyButtonColor
    }

}
