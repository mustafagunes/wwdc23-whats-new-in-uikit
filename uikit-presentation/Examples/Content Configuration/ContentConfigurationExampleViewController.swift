//
//  ContentConfigurationExampleViewController.swift
//  uikit-presentation
//
//  Created by Mustafa Gunes on 28.11.2023.
//

import UIKit

final class ContentConfigurationExampleViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    
    let segmentedControl = UISegmentedControl(items: ["empty", "loading", "search"])
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
    view.addSubview(segmentedControl)
    
    NSLayoutConstraint.activate([
      segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      segmentedControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
      segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
    ])
    
    if let config = contentUnavailableConfiguration(forSegmentIndex: 0) {
      contentUnavailableConfiguration = config
    }
  }
  
  @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
    if let config = contentUnavailableConfiguration(forSegmentIndex: sender.selectedSegmentIndex) {
      contentUnavailableConfiguration = config
    }
  }
}

extension ContentConfigurationExampleViewController {
  func contentUnavailableConfiguration(forSegmentIndex index: Int) -> UIContentUnavailableConfiguration? {
    switch index {
    case 0:
      var config = UIContentUnavailableConfiguration.empty()
      config.image = UIImage(systemName: "star.fill")
      config.text = "No Content"
      config.secondaryText = "Your content will appear here"
      return config
    case 1:
      var conf = UIContentUnavailableConfiguration.loading()
      conf.text = "LOADING"
      conf.image = UIImage(systemName: "star.fill")
      conf.secondaryText = "One seconds please :)"
      return  conf
    case 2:
      var conf = UIContentUnavailableConfiguration.search()
      conf.text = "SEARCH"
      conf.image = UIImage(systemName: "star.fill")
      conf.secondaryText = "One seconds please :)"
      return  conf
    default:
      return nil
    }
  }
}
