//
//  SignInVC:.swift
//  Help_me
//
//  Created by 최시훈 on 2023/02/07.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class SignInVC: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func didTabLogIn(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty,
              let pw = pwTextField.text, !pw.isEmpty else {
            print("이메일과 패스워드를 입력해주세요.")
            return
        }
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: pw) { [weak self] user, error in
            guard let self = self else { return }
            // 에러가 나거나 유저가 없을경우
            if let error = error, user == nil {
                print("실패")
                let alert = UIAlertController(
                    title: "🚫로그인 실패🚫",
                    message: error.localizedDescription,
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default))
                self.present(alert, animated: true, completion: nil)
            } else { // 성공이면 화면전환하고 프로필 가져오기
                let VC = Help_MeVC()
                VC.modalPresentationStyle = .fullScreen
                self.present(VC, animated: true, completion: nil)
            }
        }
        
    }
}
