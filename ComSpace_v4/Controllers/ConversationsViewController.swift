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
//        DatabaseManager.shared.test()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //
        LaunchScreen()
        if LaunchScreen().check() == true{
        validateAuth()
        }
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
    private func launchScreen(){
        
    }
}

