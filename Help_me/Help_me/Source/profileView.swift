//
//  profileView.swift
//  Help_me
//
//  Created by 최시훈 on 2023/02/08.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseDatabase
class profileVC: UIViewController {
    let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker.sourceType = .photoLibrary // 앨범에서 가져옴
        self.imagePicker.allowsEditing = true // 수정 가능 여부
        self.imagePicker.delegate = self // picker delegate
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func LogOut(_ sender: Any) {
        do {
                   try Auth.auth().signOut()
                 } catch let signOutError as NSError {
                   print ("Error signing out: %@", signOutError)
                 }
        self.dismiss(animated: true)
    }
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBAction func DidTabEditButton(_ sender: Any) {
        self.present(self.imagePicker, animated: true)
    }
}
extension profileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            var newImage: UIImage? = nil // update 할 이미지
            
            if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
                newImage = possibleImage // 수정된 이미지가 있을 경우
            } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                newImage = possibleImage // 원본 이미지가 있을 경우
            }
            
            self.profileImageView.image = newImage // 받아온 이미지를 update
            picker.dismiss(animated: true, completion: nil) // picker를 닫아줌
            
        }
}
