//
//  SignInVC:.swift
//  Help_me
//
//  Created by 최시훈 on 2023/02/07.
//

import UIKit
import Alamofire

class SignInVC: UIViewController {
    class LogIn {
        var id: String = ""
        var pw: String = ""
        var wrongId: Bool = false
        var wrongPw: Bool = false
        var request: Bool = false
        var success: Bool = false
    }
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var SignIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func logIn(_ sender: UIButton) {
        let id = idTextField.text!
        let pw = pwTextField.text!
        print(id, pw)
        
                let VC = Help_MeVC()
                VC.modalPresentationStyle = .fullScreen
                self.present(VC, animated: true, completion: nil)
                
            }
        }
    

extension SignInVC {
    
}

