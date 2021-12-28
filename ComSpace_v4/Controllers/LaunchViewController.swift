//
//  LaunchViewController.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 26.12.2021.
//

import UIKit
import FirebaseAuth

protocol LaunchViewProtocol {
    func setTabHomeVC()
}

class LaunchViewController: UIViewController, LaunchViewProtocol {

    let backgroundImageView: UIImageView = {
        let i = UIImageView()
        i.contentMode = .scaleAspectFill
        i.clipsToBounds = true
        i.image = UIImage.init(named: "launchScreen")
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    let headerLabel1: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.textAlignment = .left
        l.textColor = .white
        l.text = "ComSpace"
        l.font = UIFont(name: "Mulish-Bold", size: 40.0)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let headerLabel2: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.textAlignment = .left
        l.textColor = .white
        l.font = UIFont(name: "Mulish-Regular", size: 20.0)
        l.textColor = .white
        l.text = "community space"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let jaiLabel1: UILabel = {
        
        let jl = UILabel()
        jl.numberOfLines = 0
        jl.textAlignment = .left
        jl.textColor = .white
        jl.font = .systemFont(ofSize: 20)
        jl.text = "Networking is around you!"
        jl.font = UIFont(name: "Mulish-Bold", size: 20.0)
        jl.textColor = .white
        jl.translatesAutoresizingMaskIntoConstraints = false
        return jl
    }()
    let jaiLabel2: UILabel = {
        
        let jl = UILabel()
        jl.numberOfLines = 0
        jl.textAlignment = .left
        jl.textColor = .white
        jl.font = .systemFont(ofSize: 20)
        jl.text = "Create your own community"
        jl.font = UIFont(name: "Mulish-Bold", size: 20.0)
        jl.textColor = .white
        jl.translatesAutoresizingMaskIntoConstraints = false
        
        return jl
    }()
    
    
    lazy var startButton: UIButton = {
            let b = UIButton()
        
            b.setTitle("Get Started", for: .normal)
            b.setTitleColor(UIColor.systemOrange, for: .normal)
            b.titleLabel?.font = UIFont(name: "Mulish-Regular", size: 20.0)
            b.backgroundColor = .white
            b.layer.cornerRadius = 20
            b.layer.masksToBounds = true
            b.translatesAutoresizingMaskIntoConstraints = false
        
            return b
        }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        startButton.addTarget(self, action: #selector(validateAuth), for:.touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    func setTabHomeVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }
    }
    @objc private func validateAuth(){
        
      // saves login parameters
        if FirebaseAuth.Auth.auth().currentUser == nil {
                  let vc = LoginViewController()
            vc.delegate = self
                  let nav = UINavigationController(rootViewController: vc)
                  nav.modalPresentationStyle = .fullScreen
                  present(nav, animated: false)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController {
                vc.modalPresentationStyle = .fullScreen
                            present(vc, animated: false)
            } else {
                print("storyboard - nil")
            }
        }
        
    }
    
    func setupViews() {
        self.view.backgroundColor = .black
        
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(headerLabel1)
        self.view.addSubview(headerLabel2)
        self.view.addSubview(jaiLabel1)
        self.view.addSubview(jaiLabel2)
        
        self.view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            
            headerLabel1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            headerLabel1.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            headerLabel2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            headerLabel2.centerYAnchor.constraint(equalTo: self.headerLabel1.bottomAnchor, constant: +10),
            
            jaiLabel1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            jaiLabel1.centerYAnchor.constraint(equalTo: self.headerLabel2.bottomAnchor, constant: +60),
            jaiLabel2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            jaiLabel2.centerYAnchor.constraint(equalTo: self.jaiLabel1.bottomAnchor, constant: +10),
            
            startButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -60),
            startButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            startButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
            startButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
