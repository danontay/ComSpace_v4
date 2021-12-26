//
//  ViewController.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 20.12.2021.
//

import UIKit
import FirebaseAuth
import CoreLocation
import SwiftUI

// tipa homeclass

class ConversationsViewController: UIViewController, UIScrollViewDelegate {
//    var hm: HomeViewModel = HomeViewModel()
    let controller1 = UIHostingController(rootView: LaunchScreen())
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        
        return scrollView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        hm.locationManager.delegate = HomeViewModel()
//        hm.locationManager.requestWhenInUseAuthorization()
        view.isUserInteractionEnabled = true
        view.addSubview(controller1.view)
        setUpConstraints()
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
    fileprivate func setUpConstraints(){
        controller1.view.translatesAutoresizingMaskIntoConstraints = false
        controller1.view.topAnchor.constraint(equalTo: (view.topAnchor)).isActive = true
        controller1.view.bottomAnchor.constraint(equalTo: (view.bottomAnchor)).isActive = true
        controller1.view.rightAnchor.constraint(equalTo: (view.rightAnchor)).isActive = true
        controller1.view.leftAnchor.constraint(equalTo: (view.leftAnchor)).isActive = true
        

    }
}

//
//class HomeViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
//    @Published var locationManager = CLLocationManager()
//    @Published var search = ""
//
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        switch manager.authorizationStatus{
//        case .authorizedWhenInUse:
//            print("authorized")
//        case .denied:
//            print("denied")
//        default:
//            print("unknown")
//        }
//    }
//
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager, didFailwithError error: Error) {
//        print(error.localizedDescription)
//    }
//}
