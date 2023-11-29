//
//  LocaleImageExampleViewController.swift
//  uikit-presentation
//
//  Created by Mustafa Gunes on 28.11.2023.
//

import UIKit

final class LocaleImageExampleViewController: UIViewController {
  
  private let locales = [
    ["english": Locale(languageCode: .english)],
    ["chinese": Locale(languageCode: .chinese)],
    ["hebrew": Locale(languageCode: .hebrew)],
    ["arabic": Locale(languageCode: .arabic)],
    ["hindi": Locale(languageCode: .hindi)]
  ]
  
  
  private let languageLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  private let imageView: UIImageView = {
    let locale = Locale (languageCode: .chinese)
    
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  private lazy var animatedButton: UIButton = {
    var config = UIButton.Configuration.filled()
    config.cornerStyle = .large
    config.title = "Random Locale"
    
    let button = UIButton(configuration: config)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(buttonDidClick(_:)), for: .touchUpInside)
    return button
  }()
  
  private lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.addArrangedSubview(imageView)
    stackView.addArrangedSubview(languageLabel)
    stackView.addArrangedSubview(animatedButton)
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .fill
    return stackView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    
    view.addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
      stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
      languageLabel.heightAnchor.constraint(equalToConstant: 70),
      animatedButton.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  @objc private func buttonDidClick(_ sender: UIButton) {
    let randElement = locales.randomElement()
    
    languageLabel.text = "\(randElement?.keys.first ?? "")"
    
    let image = UIImage (
      systemName: "character.textbox",
      withConfiguration: UIImage.SymbolConfiguration(locale: randElement?.values.first ?? .current)
    )
    imageView.image = image
  }
}

