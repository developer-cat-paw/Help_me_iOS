//
//  SignUp.swift
//  Help_me
//
//  Created by μ΅μν on 2023/02/07.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

class SignUpVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var pwChackTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordSecurety()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    @IBAction func SignUp(_ sender: Any) {
        if pwTextField.text == pwChackTextField.text {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: pwTextField.text!
            ) { (user, error) in
                if user !=  nil{
                    self.dismiss(animated: true)
                }
                else{
                    let alert = UIAlertController(
                        title: "π«νμκ°μ μ€ν¨π«",
                        message: error?.localizedDescription,
                        preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "νμΈ", style: .default))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        else {
            let errorAlert = UIAlertController(
                title: "π«νμκ°μ μ€ν¨π«",
                message: "λΉλ°λ²νΈλ₯Ό νμΈν΄μ£ΌμΈμ!",
                preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "νμΈ", style: .default))
            self.present(errorAlert, animated: true, completion: nil)
        }
    }
    
    func passwordSecurety() {
        pwTextField.isSecureTextEntry = true
        pwChackTextField.isSecureTextEntry = true
    }
    
    }
