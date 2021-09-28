//
//  PostTableViewCell.swift
//  Prueba de ingreso
//
//  Created by Diego Fernando Serna Salazar on 27.09.21.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    //--------------------------------------------------------------------
    //Variables
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postBody: UILabel!
    //--------------------------------------------------------------------
    //
    func setCell(item: Post) {
        postTitle.text = item.title
        postBody.text = item.body
    }
}
