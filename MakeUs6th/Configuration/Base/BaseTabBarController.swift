//
//  BaseTabBarController.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/03/04.
//

import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {
    let homeViewController  = ViewController()
    let searchViewController  = ViewController()
    let uploadViewController  = ViewController()
    let heartViewController  = ViewController()
    let settingViewController  = ViewController()
  
    
    let homeTabBarItem  = UITabBarItem(title: "홈", image: UIImage(systemName: "home"), tag: 0)
    let searchTabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "search"), tag: 1)
    let uploadTabBarItem  = UITabBarItem(title: "업로드", image: UIImage(systemName: "upload"), tag: 2)
    let heartTabBarItem = UITabBarItem(title: "찜목록", image: UIImage(systemName: "heart"), tag: 3)
    let settingTabBarItem  = UITabBarItem(title: "설정", image: UIImage(systemName: "user"), tag: 4)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        let searchNavigationController = UINavigationController(rootViewController: searchViewController)
        let uploadNavigationController = UINavigationController(rootViewController: uploadViewController)
        let heartNavigationController = UINavigationController(rootViewController: heartViewController)
        let settingNavigationController = UINavigationController(rootViewController: settingViewController)
        
        
        homeNavigationController.tabBarItem  = homeTabBarItem
        searchNavigationController.tabBarItem  = searchTabBarItem
        uploadNavigationController.tabBarItem  = uploadTabBarItem
        heartNavigationController.tabBarItem  = heartTabBarItem
        settingNavigationController.tabBarItem  = settingTabBarItem
        //networkNavigationController.tabBarItem = networkTabBarItem
        
        self.viewControllers = [homeNavigationController, searchNavigationController,uploadNavigationController,heartNavigationController,settingNavigationController]
        
        self.delegate = self
    }
}
