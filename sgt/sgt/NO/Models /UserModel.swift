//
//  Models.swift
//  sgt
//
//  Created by Christian Riccio on 09/02/22.
//

import Foundation
import UIKit
import Firebase

let collection = Firestore.firestore().collection("Users")


struct User {
    var id:String  = UUID().uuidString
    var image: UIImage?
    var email: String
    var password: String
    var name: String
    var surname: String
    var age: Int
    var role: String
}
