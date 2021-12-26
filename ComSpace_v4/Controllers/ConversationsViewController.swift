//
//  ViewController.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 20.12.2021.
//

import UIKit
import FirebaseAuth
import SwiftUI

// tipa homeclass

class ConversationsViewController: UIViewController, UIScrollViewDelegate {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        
        return scrollView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewDidLayoutSubviews() {
        scrollView.isScrollEnabled = true
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        scrollView.contentSize = CGSize(width: 300, height: 1000)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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

