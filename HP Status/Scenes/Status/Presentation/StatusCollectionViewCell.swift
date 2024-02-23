//
//  StatusCollectionViewCell.swift
//  HP Status
//
//  Created by iOS Pozol on 23/02/24.
//

import UIKit

final class StatusCollectionViewCell: UICollectionViewCell {
  private let titleLabel: UILabel = {
    let label: UILabel = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = StatusConstants.Localizable.textDummy
    label.font = UIFont.systemFont(ofSize: StatusConstants.Modifier.titleSize, weight: .bold)
    return label
  }()
  
  private let statusCodeLabel: UILabel = {
    let label: UILabel = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: StatusConstants.Modifier.statusCodeSize, weight: .semibold)
    return label
  }()
  
  private let statusDescriptionLabel: UILabel = {
    let label: UILabel = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = StatusConstants.Localizable.textDummy
    label.font = UIFont.systemFont(ofSize: StatusConstants.Modifier.statusDescriptionSize, weight: .medium)
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configUserInterface()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configUserInterface() {
    backgroundColor = .systemBackground
    layer.cornerRadius = StatusConstants.Modifier.cornerRadius
    
    addSubview(titleLabel)
    titleLabel.topAnchor.constraint(
      equalTo: topAnchor,
      constant: StatusConstants.Modifier.generalPadding).isActive = true
    titleLabel.leadingAnchor.constraint(
      equalTo: leadingAnchor,
      constant: StatusConstants.Modifier.generalPadding).isActive = true
    
    addSubview(statusCodeLabel)
    statusCodeLabel.topAnchor.constraint(
      equalTo: topAnchor,
      constant: StatusConstants.Modifier.generalPadding).isActive = true
    statusCodeLabel.trailingAnchor.constraint(
      equalTo: trailingAnchor,
      constant: -StatusConstants.Modifier.generalPadding).isActive = true
    
    addSubview(statusDescriptionLabel)
    statusDescriptionLabel.bottomAnchor.constraint(
      equalTo: bottomAnchor,
      constant: -StatusConstants.Modifier.generalPadding).isActive = true
    statusDescriptionLabel.leadingAnchor.constraint(
      equalTo: leadingAnchor,
      constant: StatusConstants.Modifier.generalPadding).isActive = true
  }
  
  func configData(viewModel: StatusCellViewModel) {
    titleLabel.text = viewModel.title
    statusCodeLabel.text = "\(StatusConstants.Localizable.statusCode): \(viewModel.statusCode)"
    statusDescriptionLabel.text = viewModel.statusDescription
    
    statusDescriptionLabel.textColor = StatusConstants.validStatus.contains(viewModel.statusCode) ? .systemGreen : .systemRed
  }
}
