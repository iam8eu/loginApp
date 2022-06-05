//
//  ViewController.swift
//  loginApp
//
//  Created by mac on 21.03.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var buttonLogIn: UIButton!

    private let user = User.getUser()

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonLogIn.layer.cornerRadius = 10
    }
    
    @IBAction func forgotUserNamePressed() {
        showAlert("Oops", "User name: \(user.user)")
    }
    
    @IBAction func forgotPasswordPressed() {
        showAlert("Oops", "Password: \(user.password)")
    }
    
    @IBAction func buttonLogInPressed() {
        if userTF.text != user.user || passwordTF.text != user.password {
            passwordTF.text = ""
            showAlert("Error", "Invalid User name or Password!")
        }
    }
    
    @IBAction func unwindSegue(for unwindSegue: UIStoryboardSegue) {
        userTF.text = ""
        passwordTF.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for VC in viewControllers {
            if let welcomeVC = VC as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = VC as? UINavigationController {
                let aboutVC = navigationVC.topViewController as! AboutViewController
                aboutVC.user = user
            }
            
        }
            
    }
    
}

extension LoginViewController {
    private func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == userTF.text {
            passwordTF.becomeFirstResponder()
        } else {
            buttonLogInPressed()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
}
