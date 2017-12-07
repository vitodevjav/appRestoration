//
//  InfoViewController.swift
//  StateRestorationDemo
//
//  Created by Kazakevich, Vitaly on 12/7/17.
//  Copyright © 2017 Sebastian Hagedorn. All rights reserved.
//

import Foundation
import UIKit

class InfoViewController: UIViewController {

    let info: String

    let titleView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
    }()

    init(info: String) {
        self.info = info
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titleView)
        setConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleView.text = info
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([titleView.heightAnchor.constraint(equalToConstant: 100),
                                    titleView.widthAnchor.constraint(equalToConstant: 250),
                                    titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                    titleView.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    }

}
