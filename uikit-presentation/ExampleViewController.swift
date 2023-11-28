//
//  ExampleViewController.swift
//  uikit-presentation
//
//  Created by Mustafa Gunes on 28.11.2023.
//

import UIKit

enum ExampleType: String, CaseIterable {
  case previewExample = "Preview Example"
  case liftCycleExample = "Life Cycle Example"
  case contentConfigurationExample = "Content Configuration Example"
  case localeImageExample = "Locale Image Example"
  case dynamicLineHeightExample = "Dynamic Line Height Example"
  case timerPageControlExample = "Timer Page Control Example"
  case paletteMenus = "Palette Menus Example"
}

class ExampleViewController: UIViewController {
  
  var types: [ExampleType] {
    ExampleType.allCases
  }
  
  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
    tableView.delegate = self
    tableView.dataSource = self
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Examples"
    
    view.backgroundColor = .systemBackground
    
    view.addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
  }
}

extension ExampleViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    types.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description(), for: indexPath)
    
    var config = cell.defaultContentConfiguration()
    config.text = types[indexPath.row].rawValue
    cell.contentConfiguration = config
    
    return cell
  }
}

extension ExampleViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    switch types[indexPath.row] {
    case .contentConfigurationExample:
      navigationController?.show(ContentConfigurationExampleViewController(), sender: nil)
    case .dynamicLineHeightExample:
      navigationController?.show(DynamicLineHeightExampleViewController(), sender: nil)
    case .liftCycleExample:
      navigationController?.show(LifeCycleExampleViewController(), sender: nil)
    case .localeImageExample:
      navigationController?.show(LocaleImageExampleViewController(), sender: nil)
    case .paletteMenus:
      navigationController?.show(PaletteMenusExampleViewController(), sender: nil)
    case .previewExample:
      navigationController?.show(PreviewExampleViewController(), sender: nil)
    case .timerPageControlExample:
      navigationController?.show(TimerPageControlExampleViewController(), sender: nil)
    }
    navigationController?.viewControllers.last?.title = types[indexPath.row].rawValue
  }
}

