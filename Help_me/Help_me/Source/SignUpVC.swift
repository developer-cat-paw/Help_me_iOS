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
        setupNavigationBar()
    }
    @IBAction func SignUp(_ sender: Any) {
        if let email = emailTextField.text ,let password = pwTextField.text {  // 옵셔널 바인딩
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in // 회원가입을 위한 함수
                if error != nil{
                    let alert = UIAlertController(
                        title: "🚫회원가인 실패🚫",
                        message: error?.localizedDescription,
                        preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .default))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    self.dismiss(animated: true)
                }
            }
        }
    }
    
    
    private func setupNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor(red: 255.0/255, green:202.0/255, blue:40.0/255, alpha: 1)
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
}
