//
//  StatusFactory.swift
//  HP Status
//
//  Created by iOS Pozol on 23/02/24.
//

import UIKit

protocol StatusFactory {
  func makeStatusScreen(delegate: StatusViewControllerDelegate) -> UIViewController
}

struct StatusFactoryImp: StatusFactory {
  func makeStatusScreen(delegate: StatusViewControllerDelegate) -> UIViewController {
    let viewModel: StatusViewModel = StatusViewModelImp()
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.itemSize = StatusConstants.Modifier.cellSize
    let controller: StatusViewController = StatusViewController(
      viewModel: viewModel,
      layout: layout,
      delegate: delegate)
    controller.title = StatusConstants.Localizable.title
    return controller
  }
}
