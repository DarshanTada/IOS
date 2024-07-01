//
//  user_model.swift
//  lab5
//
//  Created by Admin on 2024-06-26.
//

import Foundation


class User {
    var username : String?
    var password : String?
    var fullName : String?
    var mobileNumber:String?
    
    init(username: String? = nil, password: String? = nil, fullName: String? = nil, mobileNumber: String? = nil) {
        self.username = username
        self.password = password
        self.fullName = fullName
        self.mobileNumber = mobileNumber
    }
}
