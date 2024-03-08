//
//  TabBarContoller.swift
//  GDZ
//
//  Created by Дмитрий on 07.03.2024.
//

import UIKit

final class TabBarContoller: UITabBarController {

        override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBarAppearance()
        setupViewControllers()
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

    private func setupViewControllers() {
        //TODO: Change VC to actual VC and uncomment code below this line
//        let vc1 = UINavigationController(rootViewController: LessonsVC())
//        let vc2 = UINavigationController(rootViewController: MyBooksVC())
//        let vc3 = UINavigationController(rootViewController: FavoriteVC())
//        let vc4 = UINavigationController(rootViewController: SearchVC())
//
//        vc1.title = "Предметы"
//        vc2.title = "Мои решебники"
//        vc3.title = "Избранное"
//        vc4.title = "Поиск"
//
//        vc1.tabBarItem.image = UIImage(named: "Books")
//        vc2.tabBarItem.image = UIImage(named: "BookWithBookmark")
//        vc3.tabBarItem.image = UIImage(named: "BookMark")
//        vc4.tabBarItem.image = UIImage(named: "Search")
//
//        setViewControllers([vc1,vc2,vc3,vc4], animated: true)
    }
    


}
