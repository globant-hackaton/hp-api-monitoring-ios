//
//  StatusViewController.swift
//  HP Status
//
//  Created by Javier on 23/02/24.
//

import UIKit
import Combine

protocol StatusViewControllerDelegate: AnyObject {
  func didFinishWithServicesDownNotification(titleService: String)
}

final class StatusViewController: UICollectionViewController {
  //MARK: Public Variables
  
  //MARK: Private Variables
  private let viewModel: StatusViewModel
  private weak var delegate: StatusViewControllerDelegate?
  private var cancellable = Set<AnyCancellable>()
  
  //MARK: LifeCycle
  init(viewModel: StatusViewModel, layout: UICollectionViewFlowLayout, delegate: StatusViewControllerDelegate) {
    self.viewModel = viewModel
    self.delegate = delegate
    super.init(collectionViewLayout: layout)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configUserInterface()
    configSubscription()
    viewModel.viewDidLoad()
  }
  
  //MARK: Helpers
  private func configUserInterface() { 
    collectionView.backgroundColor = .systemGroupedBackground
    collectionView.register(StatusCollectionViewCell.self, forCellWithReuseIdentifier: StatusConstants.CellId.customCell)
  }
  
  private func configSubscription() {
    viewModel
        .state
        .receive(on: RunLoop.main)
        .sink { [weak self] state in
            switch state {
            case .success:
                self?.collectionView.reloadData()
            case .loading:
                break
            case .fail(let error):
              self?.delegate?.didFinishWithServicesDownNotification(titleService: error)
            }
        }.store(in: &cancellable)
    
  }
}

//MARK: StatusViewController+Extension
extension StatusViewController { 
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard 
      let cell: StatusCollectionViewCell = collectionView
        .dequeueReusableCell(
          withReuseIdentifier: StatusConstants.CellId.customCell,
          for: indexPath) as? StatusCollectionViewCell
    else { return UICollectionViewCell() }
    
    let cellViewModel: StatusCellViewModel = viewModel.getCellViewModel(row: indexPath.row)
    cell.configData(viewModel: cellViewModel)
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    viewModel.itemsCount
  }
}
