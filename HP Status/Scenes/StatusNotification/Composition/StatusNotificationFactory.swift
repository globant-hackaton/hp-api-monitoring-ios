//
//  StatusNotificationFactory.swift
//  HP Status
//
//  Created by iOS Pozol on 23/02/24.
//

import UIKit

protocol StatusNotificationFactory {
  func makeStatusNotificationScreen() -> UIViewController
}

struct StatusNotificationFactoryImp: StatusNotificationFactory {
  func makeStatusNotificationScreen() -> UIViewController {
    let controller: UIViewController = StatusNotificationViewController()
    controller.title = StatusNotificationConstant.Localizable.servicesDown
    let navigation: UINavigationController = UINavigationController(rootViewController: controller)
    return navigation
  }
}
