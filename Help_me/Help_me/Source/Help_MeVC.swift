//
//  Help_meVC.swift
//  Help_me
//
//  Created by 최시훈 on 2023/02/07.
//

import UIKit
import Firebase
import Kingfisher
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

class Help_MeVC: UIViewController {
    var datas: [Help_Me_Model] = [Help_Me_Model(profileImageView: "👤", name: "최시훈", detailTextView: "string")]
    
    @IBOutlet weak var tableView: UITableView!
    var images = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewConfigure()
        self.tableView.reloadData()
    }
    
    func TableViewConfigure() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(Help_Me_TableViewCell.self, forCellReuseIdentifier: Help_Me_TableViewCell.className)
    }
    
    @IBAction func GoTop(_ sender: Any) {
        tableView.setContentOffset(CGPointZero, animated: true)
    }
    
    
}
extension Help_MeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Help_Me_TableViewCell.className, for: indexPath) as? Help_Me_TableViewCell
        cell!.name.text = self.datas[indexPath.row].name
        cell!.detailTextView.text = self.datas[indexPath.row].detailTextView
        cell?.selectionStyle = .none
        
        return cell ?? Help_Me_TableViewCell()
    }
}
extension Help_MeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = datas[indexPath.row]
        let goKakaoWalk = "kakaoWalk"
    }
}
