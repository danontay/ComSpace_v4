//
//  DataBaseManager.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 23.12.2021.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager{
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
//    public func test(){
//        database.child("foo").setValue(["something" : true])
//    }
    
    }
 // Account Management Part
    extension DatabaseManager {
        
        public func userExists(with email: String, completion: @escaping ((Bool) -> Void)){
            database.child(email).observeSingleEvent(of: .value, with: {snapshot in
                guard snapshot.value as? String != nil else {
                    completion(false)
                    return
                }
                completion(true)
                
            })
        }
        
        /// Inserts new users to database
        public func insertUser(with user: ChatAppUser){
            database.child(user.emailAddress).setValue([
                "first_name" : user.firstName,
                "last_name" : user.lastName,
    //            "email_address" : user.emailAddress
            ])
    }
}
public struct ChatAppUser{
     let firstName: String
     let lastName: String
     let emailAddress: String
//        let profilePictureUrl: String
 }
