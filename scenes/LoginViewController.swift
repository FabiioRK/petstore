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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        login_field.resignFirstResponder()
        password_field.resignFirstResponder()
    }
    
    @IBAction func login(_ sender: Any) {
        if let user = login_field.text, let password = password_field.text {
            if !user.isEmpty && !password.isEmpty {
                if user == "fabio" && password == "1234" {
                    if let tabBarController = storyboard?.instantiateViewController(identifier: "tabBar") {
                        tabBarController.modalTransitionStyle = .flipHorizontal
                        tabBarController.modalPresentationStyle = .fullScreen
                        self.present(tabBarController, animated: true, completion: nil)
                    }

                }
            }
        }
    }

}
