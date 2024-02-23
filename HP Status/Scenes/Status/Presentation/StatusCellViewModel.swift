//
//  StatusCellViewModel.swift
//  HP Status
//
//  Created by Javier on 23/02/24.
//

struct StatusCellViewModel {
  let model: StatusHP
  
  var title: String {
    model.title
  }
  
  var statusCode: Int {
    model.statusCode
  }
  
  var statusDescription: String {
    StatusConstants.validStatus.contains(model.statusCode) ? StatusConstants.Localizable.available : StatusConstants.Localizable.unavailable
    
  }
}
