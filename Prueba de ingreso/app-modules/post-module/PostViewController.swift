//
//  PostViewController.swift
//  Prueba de ingreso
//
//  Created by Diego Fernando Serna Salazar on 27.09.21.
//

import UIKit

class PostViewController: UIViewController {
    //--------------------------------------------------------------------
    //Variables
    var presenter:PostViewToPresenterProtocol?
    var configurator:PostConfigurator = PostConfigurator()
    var user: User?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPhone: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    //--------------------------------------------------------------------
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        configurator.configure(with: self)
        tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "postTableViewCell")
        if(user != nil){
            presenter?.getCollection(id: user!.id)
            userName.text = user?.name
            userPhone.text = user?.phone
            userEmail.text = user?.email
        }else{
            showMessage(title: "Error", message: "El usuario no ha sido identificado")
        }
    }
}
//MARK: -
extension PostViewController: PostPresenterToViewProtocol{
    func showCollection() {
        tableView.reloadData()
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
//MARK: -Table
extension PostViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.posts.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postTableViewCell")as! PostTableViewCell
        cell.setCell(item: (presenter?.posts[indexPath.row])!)
        
        cell.backgroundColor = UIColor.clear
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        return cell
    }
}
