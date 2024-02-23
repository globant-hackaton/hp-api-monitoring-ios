//
//  NavigationMediator.swift
//  HP Status
//
//  Created by Javier on 23/02/24.
//

import UIKit

final class NavigationMediatorImp {
  var statusFactory: StatusFactory
  var statusNotificationFactory: StatusNotificationFactory
  var navigation: UINavigationController
  
  init(statusFactory: StatusFactory, statusNotificationFactory: StatusNotificationFactory ,navigation: UINavigationController) {
    self.statusFactory = statusFactory
    self.statusNotificationFactory = statusNotificationFactory
    self.navigation = navigation
  }
  
  func start(window: UIWindow?) {
    navigation.pushViewController(statusFactory.makeStatusScreen(delegate: self), animated: false)
    navigation.navigationBar.prefersLargeTitles = true
    window?.rootViewController = navigation
    window?.makeKeyAndVisible()
  }
}

extension NavigationMediatorImp: StatusViewControllerDelegate {
  func didFinishWithServicesDownNotification(titleService: String) {
    let sheetViewController: UIViewController = statusNotificationFactory.makeStatusNotificationScreen(titleService: titleService)
    if let sheet = sheetViewController.sheetPresentationController {
        sheet.detents = [.medium()]
    }
    navigation.present(sheetViewController, animated: true)
  }
}
