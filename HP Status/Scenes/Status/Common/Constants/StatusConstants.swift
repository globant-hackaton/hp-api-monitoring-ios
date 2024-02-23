//
//  StatusConstants.swift
//  HP Status
//
//  Created by iOS Pozol on 23/02/24.
//

import UIKit

struct StatusConstants {
  struct Localizable {
    static let title: String = "HP-API Status"
    static let textDummy: String = "Santander For Ever"
    static let statusCode: String = "Status Code"
  }
  
  struct CellId {
    static let customCell: String = "customCell"
  }
  
  struct Modifier {
    static let generalPadding: CGFloat = 20
    static let cellSize: CGSize = CGSize(width: UIScreen.main.bounds.width - 20 , height: 100)
    static let titleSize: CGFloat = 17
    static let statusCodeSize: CGFloat = 16
    static let statusDescriptionSize: CGFloat = 17
    static let cornerRadius: CGFloat = 10
  }
  
  static let validStatus: ClosedRange<Int> = 200...299
}
