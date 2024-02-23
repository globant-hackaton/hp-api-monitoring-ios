//
//  StatusViewController.swift
//  HP Status
//
//  Created by iOS Pozol on 23/02/24.
//

import UIKit

final class StatusViewController: UICollectionViewController {
  //MARK: Public Variables
  
  //MARK: Private Variables
  private let viewModel: StatusViewModel
  
  //MARK: LifeCycle
  init(viewModel: StatusViewModel, layout: UICollectionViewFlowLayout) {
    self.viewModel = viewModel
    super.init(collectionViewLayout: layout)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configUserInterface()
  }
  
  //MARK: Helpers
  private func configUserInterface() { 
    collectionView.backgroundColor = .systemGroupedBackground
    collectionView.register(StatusCollectionViewCell.self, forCellWithReuseIdentifier: StatusConstants.CellId.customCell)
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
