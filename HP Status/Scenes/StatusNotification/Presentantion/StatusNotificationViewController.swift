//
//  StatusNotificationViewController.swift
//  HP Status
//
//  Created by Javier on 23/02/24.
//

import UIKit

final class StatusNotificationViewController: UIViewController {
  //MARK: Public Variables
  
  //MARK: Private Variables
  private var harryDownImageView: UIImageView = {
    let imageView: UIImageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    imageView.image = UIImage(named: StatusNotificationConstant.Resource.harryDownImage)
    imageView.heightAnchor.constraint(equalToConstant: StatusNotificationConstant.Modifier.heightImage).isActive = true
    imageView.layer.cornerRadius = StatusConstants.Modifier.cornerRadius
    return imageView
  }()
  
  private let titleLabel: UILabel = {
    let label: UILabel = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = StatusConstants.Localizable.textDummy
    label.font = UIFont.systemFont(ofSize: StatusConstants.Modifier.statusCodeSize, weight: .semibold)
    return label
  }()
  
  private var titleService: String = ""
  
  //MARK: LifeCycle
  init(titleService: String) {
    self.titleService = titleService
    super.init(nibName: nil, bundle: nil)
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
    view.backgroundColor = .systemBackground
    
    view.addSubview(titleLabel)
    titleLabel.topAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.topAnchor,
      constant: StatusConstants.Modifier.generalPadding).isActive = true
    titleLabel.centerXAnchor.constraint(
      equalTo: view.centerXAnchor).isActive = true
    titleLabel.text = titleService
    
    
    view.addSubview(harryDownImageView)
    harryDownImageView.bottomAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.bottomAnchor,
      constant: -StatusConstants.Modifier.generalPadding).isActive = true
    
    harryDownImageView.leadingAnchor.constraint(
      equalTo: view.leadingAnchor,
      constant: StatusConstants.Modifier.generalPadding).isActive = true
    
    harryDownImageView.trailingAnchor.constraint(
      equalTo: view.trailingAnchor,
      constant: -StatusConstants.Modifier.generalPadding).isActive = true
  }
}
