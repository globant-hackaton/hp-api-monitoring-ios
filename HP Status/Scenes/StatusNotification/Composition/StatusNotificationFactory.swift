//
//  StatusNotificationFactory.swift
//  HP Status
//
//  Created by Javier on 23/02/24.
//

import UIKit

protocol StatusNotificationFactory {
  func makeStatusNotificationScreen(titleService: String) -> UIViewController
}

struct StatusNotificationFactoryImp: StatusNotificationFactory {
  func makeStatusNotificationScreen(titleService: String) -> UIViewController {
    let controller: UIViewController = StatusNotificationViewController(titleService: titleService)
    controller.title = StatusNotificationConstant.Localizable.servicesDown
    let navigation: UINavigationController = UINavigationController(rootViewController: controller)
    return navigation
  }
}
