//
//  WelcomeViewController.swift
//  loginApp
//
//  Created by mac on 21.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    var user: User!
    @IBOutlet var welcomeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user.person.firstName) \(user.person.lastName)!"
    }

}
