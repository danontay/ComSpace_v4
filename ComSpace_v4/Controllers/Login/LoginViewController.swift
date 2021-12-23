//
//  LoginViewController.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 20.12.2021.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        
        return scrollView
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 20
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.placeholder = "Email Address..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 20
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.placeholder = "Password..."
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.isSecureTextEntry = true
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        return field
    }()
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .primaryColor
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Log In"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Register",
            style: .done,
            target: self,
            action: #selector(didTabRegister)
        )
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(loginButton)
        
        loginButton.addTarget(self,
                              action: #selector(loginButtontapped),
                              for: .touchUpInside)
        emailField.delegate = self
        passwordField.delegate = self
        
//        view.addSubview(scrollView)
//        scrollView.addSubview(imageView)
//        scrollView.addSubview(emailField)
//        scrollView.addSubview(passwordField)
//        scrollView.addSubview(loginButton)
    }
    
    @objc private func didTabRegister(){
        let vc = RegisterViewController()
        vc.title = "Create Account"
     //   navigationController?.pushViewController(vc, animated: true)
        navigationController?.pushViewController(vc, animated: true)
        
    }
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "MainLogoSvg")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let size = view.width/3
        scrollView.frame = view.bounds
        
        imageView.frame = CGRect(x: (scrollView.width-size)/2 + 10,
                                 y: 20,
                                 width: size,
                                 height: size)
        
        emailField.frame = CGRect(x: 30,
                                  y: imageView.bottom+10,
                                  width: scrollView.width-60,
                                 height: 62)
        passwordField.frame = CGRect(x: 30,
                                  y: emailField.bottom+10 ,
                                  width: scrollView.width-60,
                                  height: 62)
        loginButton.frame = CGRect(x: 30,
                                  y: passwordField.bottom+10 ,
                                  width: scrollView.width-60,
                                  height: 62)
    }
    @objc private func loginButtontapped(){
        
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailField.text, let password = passwordField.text, !email.isEmpty, !password.isEmpty, password.count >= 6
        else{
            alertUserLoginError()

            return
        }
        // firebase log in
        
        DatabaseManager.shared.userExists(with: email, completion: {[weak self] exists in
            guard let strongSelf = self else{
                return
            }
            
            guard !exists  else{
                // user already exists
                strongSelf.alertUserLoginError(message: "Looks like a user account for that email is already exists")

                return
            }
            
            Firebase.Auth.auth().signIn(withEmail:  email, password: password, completion: {authResult, error in
              
            
                guard let result = authResult, error == nil else {
                    print(" Failed to log in user with email: \(email)")
                    return
                }
                let user = result.user
                print("Logged In User \(user)")
                strongSelf.navigationController?.dismiss(animated: true, completion: nil)
            })
        })
//
//        Firebase.Auth.auth().signIn(withEmail:  email, password: password, completion: {[weak self] authResult, error in
//
//            guard let strongSelf = self else{
//                return
//            }
//            guard let result = authResult, error == nil else {
//                print(" Failed to log in user with email: \(email)")
//                return
//            }
//            let user = result.user
//            print("Logged In User \(user)")
//            strongSelf.navigationController?.dismiss(animated: true, completion: nil)
//        })
    }
    func alertUserLoginError(message : String = "Please enter all information to log in"){
        
        let alert =  UIAlertController(title: "Woops",
                                       message: message,
                                       preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(
            title: "Dissmiss",
            style: .cancel,
            handler: nil))
        present(alert, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField{
            loginButtontapped()
        }
        
        return true
    }
}
