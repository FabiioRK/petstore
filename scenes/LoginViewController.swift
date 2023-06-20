//
//  LoginViewController.swift
//  petstore
//
//  Created by pat002890 on 25/04/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var login_field: UITextField!
    
    @IBOutlet weak var password_field: UITextField!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if (UserDefaults.standard.bool(forKey: "autologin")) {
            if let tabBarController = storyboard?.instantiateViewController(identifier: "tabBar") {
                tabBarController.modalTransitionStyle = .flipHorizontal
                tabBarController.modalPresentationStyle = .fullScreen
                self.present(tabBarController, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        login_field.resignFirstResponder()
        password_field.resignFirstResponder()
    }
    
    @IBAction func login(_ sender: Any) {
        if validateUser() {
            if let tabBarController = storyboard?.instantiateViewController(identifier: "tabBar") {
                tabBarController.modalTransitionStyle = .flipHorizontal
                tabBarController.modalPresentationStyle = .fullScreen
                self.present(tabBarController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func handleAutoLogin(_ sender: UISwitch) {
        if (validateUser() && sender.isOn) {
            UserDefaults.standard.setValue(true, forKey: "autologin")
            UserDefaults.standard.synchronize()
        }
    }
    
    
    func validateUser() -> Bool {
        if let user = login_field.text, let password = password_field.text {
            if !user.isEmpty && !password.isEmpty {
                if user == "fabio" && password == "1234" {
                    return true
                
                }
            }
        }
        return false
    }
}
