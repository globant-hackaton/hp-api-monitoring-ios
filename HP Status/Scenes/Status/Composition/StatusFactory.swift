//
//  StatusFactory.swift
//  HP Status
//
//  Created by Javier on 23/02/24.
//

import UIKit
import Combine

protocol StatusFactory {
  func makeStatusScreen(delegate: StatusViewControllerDelegate) -> UIViewController
}

struct StatusFactoryImp: StatusFactory {
  func makeStatusScreen(delegate: StatusViewControllerDelegate) -> UIViewController {
    let statusHPRepository: StatusHPRepository = StatusHPRepository2Dummy()
    let state = PassthroughSubject<StateController, Never>()
    let viewModel: StatusViewModel = StatusViewModelImp(statusHPRepository: statusHPRepository, state: state)
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
