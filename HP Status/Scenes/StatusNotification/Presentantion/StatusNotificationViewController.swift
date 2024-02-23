//
//  StatusNotificationViewController.swift
//  HP Status
//
//  Created by iOS Pozol on 23/02/24.
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
  
  //MARK: LifeCycle
  init() {
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
