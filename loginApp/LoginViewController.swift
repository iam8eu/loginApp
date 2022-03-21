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

    private let goodUser = "User"
    private let goodPassword = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonLogIn.layer.cornerRadius = 10
    }
    
    @IBAction func forgotUserNamePressed() {
        showAlert("Oops", "User name: \(goodUser)")
    }
    
    @IBAction func forgotPasswordPressed() {
        showAlert("Oops", "Password: \(goodPassword)")
    }
    
    @IBAction func buttonLogInPressed() {
        if userTF.text != goodUser || passwordTF.text != goodPassword {
            passwordTF.text = ""
            showAlert("Error", "Invalid User name or Password!")
        }
    }
    
    @IBAction func unwindSegue(for unwindSegue: UIStoryboardSegue) {
        userTF.text = ""
        passwordTF.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.user = userTF.text
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
