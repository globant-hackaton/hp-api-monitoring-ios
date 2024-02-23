//
//  StatusFactory.swift
//  HP Status
//
//  Created by iOS Pozol on 23/02/24.
//

import UIKit

struct StatusFactoryImp {
  func makeStatusScreen() -> UIViewController {
    let viewModel: StatusViewModel = StatusViewModelImp()
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.itemSize = StatusConstants.Modifier.cellSize
    let controller: StatusViewController = StatusViewController(viewModel: viewModel, layout: layout)
    controller.title = StatusConstants.Localizable.title
    let navigation: UINavigationController = UINavigationController(rootViewController: controller)
    navigation.navigationBar.prefersLargeTitles = true
    return navigation
  }
}
