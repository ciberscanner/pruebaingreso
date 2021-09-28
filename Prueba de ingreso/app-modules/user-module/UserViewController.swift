//
//  UserViewController.swift
//  Prueba de ingreso
//
//  Created by Diego Fernando Serna Salazar on 26.09.21.
//

import UIKit

class UserViewController: UIViewController {
    //--------------------------------------------------------------------
    //Variables
    var presenter:UserViewToPresenterProtocol?
    var configurator:UserConfigurator = UserConfigurator()
    var filterUsers = Array<User>()

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var uiTable: UITableView!
    @IBOutlet weak var viewEmpty: UIView!
    
    var isSearchBarEmpty: Bool {return searchBar.text?.isEmpty ?? true}
    //--------------------------------------------------------------------
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        configurator.configure(with: self)
        uiTable.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "usertableviewcell")
        presenter?.getUsers()
        presenter?.getPosts()
    }
}
//MARK: -
extension UserViewController: UserPresenterToViewProtocol{
    func showUsers() {
        uiTable.reloadData()
    }
    //--------------------------------------------------------------------
    //
    func showMessage(title:String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
//MARK: -TABLE
extension UserViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearchBarEmpty{
            return presenter?.users.count ?? 0
        }else{
            return filterUsers.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usertableviewcell")as! UserTableViewCell
        if isSearchBarEmpty{
            cell.setCell(user: presenter!.users[indexPath.row])
        }else{
            cell.setCell(user: filterUsers[indexPath.row])
        }
        cell.presenter = presenter
        return cell
    }
}
//MARK: -SEARCHBAR
extension UserViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty{
            filterUsers = presenter!.users.filter({(user:User) ->
                Bool in let name = user.name.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
                return name != nil})
            if filterUsers.count == 0{
                print("Lista vacia")
                viewEmpty.isHidden = false
            }else{
                viewEmpty.isHidden = true
            }
        }
        uiTable.reloadData()
    }
}
