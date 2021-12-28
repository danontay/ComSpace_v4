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
    
    static func safeEmail(emailAddress: String) -> String {
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "#", with: "-")
        return safeEmail
    }
    
//    public func test(){
//        database.child("foo").setValue(["something" : true])
//    }
    
    }
 // Account Management Part
    extension DatabaseManager {
        
        public func userExists(with email: String, completion: @escaping ((Bool) -> Void)){
            
            
            var safeEmail = email.replacingOccurrences(of: ".", with: "-")
            safeEmail = safeEmail.replacingOccurrences(of: "#", with: "-")
            
            database.child(safeEmail).observeSingleEvent(of: .value, with: {snapshot in
                guard snapshot.value as? String != nil else {
                    completion(false)
                    return
                }
                completion(true)
                
            })
        }
        
        /// Inserts new users to database
        public func insertUser(with user: ChatAppUser, completion:  @escaping (Bool) -> Void ){
            database.child(user.safeEmail).setValue([
                "first_name" : user.firstName,
                "last_name" : user.lastName,
    //            "email_address" : user.emailAddress
            ], withCompletionBlock: {error, _ in
                guard error == nil else {
                    print("failed to write to database")
                    completion(false)
                    return
                }
                completion(true )
            })
    }
}
public struct ChatAppUser{
     let firstName: String
     let lastName: String
     let emailAddress: String
        
    var safeEmail: String {
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        
        return safeEmail
    }
    var profilePictureFileName: String{
        return "\(safeEmail)_profile_picture.png"
    }
    
 }
 
