//
//  StatusViewModel.swift
//  HP Status
//
//  Created by iOS Pozol on 23/02/24.
//

protocol StatusViewModel {
  var itemsCount: Int { get }
  func getCellViewModel(row: Int) -> StatusCellViewModel
}

final class StatusViewModelImp: StatusViewModel {

  var itemsCount: Int {
    4
  }
  
  func getCellViewModel(row: Int) -> StatusCellViewModel {
    StatusCellViewModel()
  }
  
}
