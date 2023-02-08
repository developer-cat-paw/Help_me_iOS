//
//  Help_meVC.swift
//  Help_me
//
//  Created by 최시훈 on 2023/02/07.
//

import UIKit

class Help_MeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //    @IBAction func GoTop(_ sender: Any) {
    //        tableView.setContentOffset(CGPointZero, animated: true)
    //    }
    @IBAction func dontlikedev(_ sender: Any) {
        let urlString = "tel://" + "010-5475-2657"
        let numberURL = NSURL(string: urlString)
        UIApplication.shared.openURL(numberURL! as URL)
    }
    @IBAction func like_apple(_ sender: Any) {
        let urlString = "tel://" + "010-5475-2657"
        let numberURL = NSURL(string: urlString)
        UIApplication.shared.openURL(numberURL! as URL)
    }
    @IBAction func devwithweb(_ sender: Any) {
        let urlString = "tel://" + "010-5475-2657"
        let numberURL = NSURL(string: urlString)
        UIApplication.shared.openURL(numberURL! as URL)
        
        
    }
}
