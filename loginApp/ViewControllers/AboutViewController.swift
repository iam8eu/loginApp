//
//  AboutViewController.swift
//  loginApp
//
//  Created by mac on 05.06.2022.
//

import UIKit

class AboutViewController: UIViewController {

    var user: User!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.person.firstName + " " + user.person.lastName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let moreVC = segue.destination as? MoreViewController else { return }
        moreVC.user = user
    }
}
