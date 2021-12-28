//
//  MyEventsViewController.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 20.12.2021.
//

import UIKit
import SwiftUI

class AllEventsViewController: UIViewController, UIScrollViewDelegate {

    let controller1 = UIHostingController(rootView: MyEvents())
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
//        view.insetsLayoutMarginsFromSafeArea = true
        scrollView.isScrollEnabled = true
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
    
        
        scrollView.contentSize = CGSize(width: 300, height: 1000)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
 
    fileprivate func setUpConstraints(){
        controller1.view.translatesAutoresizingMaskIntoConstraints = false

        controller1.view.topAnchor.constraint(equalTo: (self.view.safeAreaLayoutGuide.topAnchor)).isActive = true
        controller1.view.bottomAnchor.constraint(equalTo: (self.view.safeAreaLayoutGuide.bottomAnchor)).isActive = true
        controller1.view.rightAnchor.constraint(equalTo: (self.view.safeAreaLayoutGuide.rightAnchor)).isActive = true
        controller1.view.leftAnchor.constraint(equalTo: (self.view.safeAreaLayoutGuide.leftAnchor)).isActive = true
        
    }
}
