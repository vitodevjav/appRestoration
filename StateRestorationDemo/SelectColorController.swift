//
//  SelectColorController.swift
//  StateRestorationDemo
//
//  Created by Kazakevich, Vitaly on 12/7/17.
//  Copyright © 2017 Sebastian Hagedorn. All rights reserved.
//

import Foundation
import UIKit

class SelectColorController: UIViewController {
    var backgroundColor: UIColor

    let dismissButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dismissController), for: .allTouchEvents)
        button.titleLabel?.text = "Go back"
        return button
    }()

    let nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pushNext), for: .allTouchEvents)
        button.titleLabel?.text = "Next"
        return button
    }()

    init(color: UIColor) {
        backgroundColor = color
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(dismissButton)
        view.addSubview(nextButton)
        view.backgroundColor = backgroundColor
        setConstraints()
    }

    func setConstraints() {
        NSLayoutConstraint.activate([dismissButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
                                     dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     dismissButton.heightAnchor.constraint(equalToConstant: 40.0),
                                     dismissButton.widthAnchor.constraint(equalToConstant: 140.0),
                                     nextButton.heightAnchor.constraint(equalToConstant: 40.0),
                                     nextButton.widthAnchor.constraint(equalToConstant: 140.0),
                                     nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
    }

    @objc func pushNext() {
        navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    }

    @objc func dismissController() {
        dismiss(animated: true, completion: nil)
    }
}
