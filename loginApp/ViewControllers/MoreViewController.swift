//
//  MoreViewController.swift
//  loginApp
//
//  Created by mac on 05.06.2022.
//

import UIKit

class MoreViewController: UIViewController {
    @IBOutlet var labelOne: UILabel!
    @IBOutlet var labelTwo: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelOne.text = "Hobby: " + user.person.hobby
        labelTwo.text = "Emoji: \(user.person.emoji)"
    }
    

}
