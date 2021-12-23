//
//  ViewController.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 20.12.2021.
//

import UIKit
import FirebaseAuth

// tipa homeclass

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
//        DatabaseManager.shared.test()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")
//
//        if !isLoggedIn{
//            let vc = LoginViewController()
//            let nav = UINavigationController(rootViewController: vc)
//            nav.modalPresentationStyle = .fullScreen
//            present(nav, animated: false)
//        }
        validateAuth()
    }
    private func validateAuth(){
        
      // saves login parameters 
        if FirebaseAuth.Auth.auth().currentUser == nil {
                  let vc = LoginViewController()
                  let nav = UINavigationController(rootViewController: vc)
                  nav.modalPresentationStyle = .fullScreen
                  present(nav, animated: false)
              }
        
    }
}

