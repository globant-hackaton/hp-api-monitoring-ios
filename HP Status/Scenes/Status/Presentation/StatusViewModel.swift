//
//  StatusViewModel.swift
//  HP Status
//
//  Created by Javier on 23/02/24.
//

import Combine

protocol StatusViewModel {
  var itemsCount: Int { get }
  var state: PassthroughSubject<StateController, Never> { get }
  func getCellViewModel(row: Int) -> StatusCellViewModel
  func viewDidLoad()
}

final class StatusViewModelImp: StatusViewModel {
  private let statusHPRepository: StatusHPRepository
  
  private var statusHP: [StatusHP] = []
  
  var state: PassthroughSubject<StateController, Never>
  
  var itemsCount: Int {
    statusHP.count
  }
  
  init(statusHPRepository: StatusHPRepository, state: PassthroughSubject<StateController, Never>) {
    self.statusHPRepository = statusHPRepository
    self.state = state
  }
  
  func getCellViewModel(row: Int) -> StatusCellViewModel {
    let model: StatusHP = statusHP[row]
    return StatusCellViewModel(model: model)
  }
  
  func viewDidLoad() {
    statusHPRepository.getStatus { [weak self] result in
      self?.statusHP = result
      self?.state.send(.success)
      self?.checkServiceUnavailable()
    }
  }
  
  private func checkServiceUnavailable() {
    let statusHP: StatusHP? = statusHP.first { statusHP in
      !StatusConstants.validStatus.contains(statusHP.statusCode)
    }
    
    if statusHP != nil {
      state.send(.fail(error: statusHP?.title ?? ""))
    }
  }
}
