//
//  UserInfo.swift
//  sgt
//
//  Created by Christian Riccio on 11/02/22.
//

import Foundation
import FirebaseAuth

/// The object injected into the environment holding the user's current authentication
/// state and an instance of the FBUser object
public class UserInfo: ObservableObject {

    @Published var user: UserViewModel? = nil
    
    init(){
    }
    
}

