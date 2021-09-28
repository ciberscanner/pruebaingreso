//
//  UserTableViewCell.swift
//  Prueba de ingreso
//
//  Created by Diego Fernando Serna Salazar on 26.09.21.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    //--------------------------------------------------------------------
    //Variables
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPhone: UILabel!
    @IBOutlet weak var userMail: UILabel!
    @IBOutlet weak var background: UIView!
    var presenter:UserViewToPresenterProtocol?
    var user:User?
    //--------------------------------------------------------------------
    //
    @IBAction func showUserPost(_ sender: Any) {
        if user != nil{
            presenter?.showViewController(user: user!)
        }
    }
    //--------------------------------------------------------------------
    //
    func setCell(user: User) {
        self.user = user
        userName.text = user.name
        userPhone.text = user.phone
        userMail.text = user.email
        background.layer.cornerRadius = 5.0
        
        backgroundColor = UIColor.clear
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        selectedBackgroundView = backgroundView
    }
}
