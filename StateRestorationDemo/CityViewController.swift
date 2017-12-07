//
//  CityViewController.swift
//  StateRestorationDemo
//
//  Created by Sebastian Hagedorn on 05/07/14.
//  Copyright (c) 2014 Sebastian Hagedorn. All rights reserved.
//

import UIKit

class CityViewController: UIViewController, UIViewControllerRestoration {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    private var cityName: String

    let redButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(redButtonTapped), for: .allTouchEvents)
        button.backgroundColor = .red
        return button
    }()

    let greenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(greenButtonTapped), for: .allTouchEvents)
        button.backgroundColor = .green
        return button
    }()

    let blueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(blueButtonTapped), for: .allTouchEvents)
        button.backgroundColor = .blue
        return button
    }()

    init(cityName: String) {
        self.cityName = cityName
        super.init(nibName: nil, bundle: nil)
        hidesBottomBarWhenPushed = true
        restorationIdentifier = String(describing: type(of: self))
        restorationClass = type(of: self)
    }

    required init(coder aDecoder: NSCoder) {
        cityName = ""
        assert(false, "init(coder:) not supported. Please use init(cityName:) instead.")
        super.init(coder: aDecoder)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(redButton)
        view.addSubview(blueButton)
        view.addSubview(greenButton)
        setConstraints()
        updateView()
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([redButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
                                     redButton.heightAnchor.constraint(equalToConstant: 40.0),
                                     redButton.widthAnchor.constraint(equalToConstant: 100.0),
                                     redButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     greenButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
                                     greenButton.heightAnchor.constraint(equalToConstant: 40.0),
                                     greenButton.widthAnchor.constraint(equalToConstant: 100.0),
                                     greenButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 110),
                                     blueButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
                                     blueButton.heightAnchor.constraint(equalToConstant: 40.0),
                                     blueButton.widthAnchor.constraint(equalToConstant: 100.0),
                                     blueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 220)])
    }

    private func updateView() {
        nameLabel.text = cityName
        imageView.image = UIImage(named: cityName)
    }

    @objc func redButtonTapped() {
        presentNavigationController(color: .red)
    }

    @objc func greenButtonTapped() {
        presentNavigationController(color: .green)
    }

    @objc func blueButtonTapped() {
        presentNavigationController(color: .blue)
    }

    private func presentNavigationController(color: UIColor) {
        let rootController = SelectColorController(color: color)
        let navigation = UINavigationController(rootViewController: rootController)
        present(navigation, animated: true, completion: nil)
    }

    static func viewController(withRestorationIdentifierPath identifierComponents: [Any], coder: NSCoder) -> UIViewController? {
        assert(String(describing: self) == (identifierComponents.last as! String), "unexpected restoration path: \(identifierComponents)")

        guard let restoredName = coder.decodeObject(forKey: encodingKeyCityName) as? String else {
            print("decoding the city name failed")
            return nil
        }

        return CityViewController(cityName: restoredName)
    }

    static private let encodingKeyCityName = "encodingKeyCityName"

    override func encodeRestorableState(with coder: NSCoder)  {
        super.encodeRestorableState(with: coder)
        coder.encode(cityName as NSString, forKey: CityViewController.encodingKeyCityName)
    }
}
