//
//  SignUp.swift
//  Help_me
//
//  Created by 최시훈 on 2023/02/07.
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
                        title: "🚫회원가입 실패🚫",
                        message: error?.localizedDescription,
                        preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .default))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        else {
            let errorAlert = UIAlertController(
                title: "🚫회원가입 실패🚫",
                message: "비밀번호를 확인해주세요!",
                preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "확인", style: .default))
            self.present(errorAlert, animated: true, completion: nil)
        }
    }
    
    func passwordSecurety() {
        pwTextField.isSecureTextEntry = true
        pwChackTextField.isSecureTextEntry = true
    }
    
    }
