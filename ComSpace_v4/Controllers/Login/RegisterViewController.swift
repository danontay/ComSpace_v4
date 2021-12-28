//
//  RegisterViewController.swift
//  ComSpace_v1
//
//  Created by Зарина Умурзакова on 28.11.2021.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    

    func makeUIView() -> UITextView {
            let textView = UITextView()
            textView.attributedText.value(forKey: "Login")
            textView.autocapitalizationType = .sentences
            textView.isSelectable = true
            textView.isUserInteractionEnabled = true
            
            return textView
        }
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
//        scrollView.clipsToBounds = true
        scrollView.isScrollEnabled = true
        
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
    
    private let firstNameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 20
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.placeholder = "First Name..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    private let lastNameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 20
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.placeholder = "Last Name..."
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
        field.placeholder = " Password..."
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.isSecureTextEntry = true
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        return field
    }()
    
    private let UsernameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 20
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.placeholder = " Username..."
        field.leftViewMode = .always
        field.backgroundColor = .white
//        field.isSecureTextEntry = true
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        return field
    }()
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .primaryColor
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    private let label: UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        label.text = "Registration."
        label.font = .mulishBold(size: 34)
        label.textColor = .secondaryColor
//        label.font = UIFont.systemFont(ofSize: 34.0)
        label.font = UIFont.boldSystemFont(ofSize: 34.0)
//        label.font = UIFont.italicSystemFont(ofSize: 34.0)
        return label
    }()
    private let Sublabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        label.text = "Hello, Welcome to our team!"
        label.font = .mulishBold(size: 15)
        label.textColor = .LabelGray
//        label.font = UIFont.systemFont(ofSize: 34.0)
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
//        label.font = UIFont.italicSystemFont(ofSize: 34.0)
        return label
    }()
    private let labelOfTerms: UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        label.text = "By registering, you agree to our terms of use"
        label.font = .mulishBold(size: 15)
        label.textColor = .secondaryColor
//        label.font = UIFont.systemFont(ofSize: 34.0)
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
//        label.font = UIFont.italicSystemFont(ofSize: 34.0)
        return label
    }()
    
    private let сhangeImageView: UIImageView = {
        let ChangeImageView = UIImageView()
        ChangeImageView.image = UIImage(systemName: "person.fill.badge.plus")
        ChangeImageView.tintColor = .primaryColor
        ChangeImageView.contentMode = .scaleAspectFit
        ChangeImageView.isUserInteractionEnabled = true;
        ChangeImageView.layer.masksToBounds = true
        ChangeImageView.layer.borderWidth = 2
        ChangeImageView.layer.borderColor = UIColor.primaryColor.cgColor
        return ChangeImageView
    }()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Registration"
        view.backgroundColor = .white
        
        registerButton.addTarget(self,
                              action: #selector(registerButtontapped),
                              for: .touchUpInside)
        
        emailField.delegate = self
        passwordField.delegate = self
        
        scrollView.center = view.center
        view.addSubview(scrollView)
        scrollView.addSubview(label)
        scrollView.addSubview(Sublabel)
        scrollView.addSubview(сhangeImageView)
        scrollView.addSubview(firstNameField)
        scrollView.addSubview(lastNameField)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(UsernameField)
        scrollView.addSubview(registerButton)
        scrollView.addSubview(labelOfTerms)

        setGestures()
      
    }
    
    func setGestures() {
        let imageTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfilePicture(_:)))
        сhangeImageView.isUserInteractionEnabled = true
        сhangeImageView.addGestureRecognizer(imageTapGesture)
    }
    
    @objc func didTapChangeProfilePicture(_ gesture: UITapGestureRecognizer){
        print("Change Pic called" , gesture)
        PresentPhotoActionSheet()
    }
    @objc func didTapChangeLabel(_ gesture: UITapGestureRecognizer){
        print("Label is called" , gesture)
        PresentPhotoActionSheet()
    }
    
    override func viewDidLayoutSubviews() {
        scrollView.isScrollEnabled = true
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        scrollView.contentSize = CGSize(width: 300, height: 1000)
        
        let size = view.width/3
        print(view.width/3)
        let size2 = 320.0
        let sizeH = 50.0
//
//        scrollView.isUserInteractionEnabled = true
//        ChangeImageView.isUserInteractionEnabled = true
//        let gesture = UIGestureRecognizer(target: self, action: #selector(didTapChangeProfilePicture(_:)))
//
//        gesture.delegate = self
        
//        ChangeImageView.addGestureRecognizer(gesture)
//        view.isUserInteractionEnabled = true
        
        сhangeImageView.frame = CGRect(x: (scrollView.width-size)/2 + 20,
                                       y: Sublabel.bottom+10,
                                 width: size-40,
                                 height: size-40)
        сhangeImageView.layer.cornerRadius = сhangeImageView.width / 2.0
        
        label.frame = CGRect(
            x: (scrollView.width-size)/3 + 12,
            y: 20,
            width: size2,
            height: sizeH)
        
        Sublabel.frame = CGRect(
            x: (scrollView.width-size)/3 + 12,
            y:label.bottom,
            width: size2,
            height: sizeH
        )
        
        firstNameField.frame = CGRect(x: 30,
                                      y: сhangeImageView.bottom + 10,
                                  width: scrollView.width-60,
                                  height: 62)
        lastNameField.frame = CGRect(x: 30,
                                  y: firstNameField.bottom+10 ,
                                  width: scrollView.width-60,
                                  height: 62)
        emailField.frame = CGRect(x: 30,
                                  y: lastNameField.bottom+10 ,
                                  width: scrollView.width-60,
                                  height: 62)
        passwordField.frame = CGRect(x: 30,
                                  y: emailField.bottom+10 ,
                                  width: scrollView.width-60,
                                  height: 62)
        UsernameField.frame = CGRect(x: 30,
                                  y: passwordField.bottom+10 ,
                                  width: scrollView.width-60,
                                  height: 62)
        registerButton.frame = CGRect(x: 30,
                                  y: UsernameField.bottom+30 ,
                                  width: scrollView.width-60,
                                  height: 62)
        labelOfTerms.frame = CGRect(x: 35, y: registerButton.bottom + 30, width: scrollView.width-60, height: 50)
//        ChangeImageView.frame = CGRect(x: 35, y:labelOfTerms.bottom, width: scrollView.width/2, height: scrollView.width/2)

    }
    @objc private func registerButtontapped(){
        сhangeImageView.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        UsernameField.resignFirstResponder()
        
        guard
            let email = emailField.text,
            let password = passwordField.text,
            let firstName = firstNameField.text,
            let lastName = lastNameField.text,
                !email.isEmpty,
                !password.isEmpty,
                !firstName.isEmpty,
                !lastName.isEmpty,
                password.count >= 6
        else{
            alertUserLoginError()
            return
        }
        // firebase log in
        
//        spinner.show(in: view)
        
        DatabaseManager.shared.userExists(with: email, completion: {[weak self] exists in
            guard let strongSelf = self else {
                return
            }
            guard !exists else {
                // user already exists
                strongSelf.alertUserLoginError(message: "Looks  like a user is aleady exists")
                return
            }
            
        })
        
        Firebase.Auth.auth().createUser(withEmail: email, password: password, completion: {[weak self] authResult, error in
            guard let strongSelf = self else { return }
            
            guard authResult != nil, error == nil else {
                print("Error creatingUser")
                return
            } 
            
//            let user = result.user
//            print("User id created \(user)")
            let cUser =  ChatAppUser(firstName: firstName,
                                     lastName: lastName,
                                     emailAddress: email)
            DatabaseManager.shared.insertUser(with: cUser, completion: {success in
                if success {
                    // upload image
                    guard let image = strongSelf.сhangeImageView.image, let data = image.pngData()
                    else{
                        
                        return
                        
                    }
                    let fileName = cUser.profilePictureFileName
                    StorageManager.shared.profileUploadPicture(with: data, fileName: fileName, completion: {result in
                        switch result{
                        case .success(let downloadUrl):
                            UserDefaults.standard.set(downloadUrl, forKey: "profile_picture_url")
                             print(downloadUrl)
                            
                        case .failure(let error):
                            print("Storage manager error \(error)")
                             
                        }
                    })
                }
            } )
            
            strongSelf.navigationController?.dismiss(animated: true, completion: nil)
        })
    }
    func alertUserLoginError(message: String = "Please enter all information"){
        
        let alert =  UIAlertController(title: "Woops", message: "Please enter all information to create a new account.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(
            title: "Dissmiss",
            style: .cancel,
            handler: nil))
        
        present(alert, animated: true)
    }
    @objc private func didTabRegister(){
        let vc = RegisterViewController()
        vc.title = "Create Account"
     //   navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
extension RegisterViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == firstNameField {
            lastNameField.becomeFirstResponder()
        }
        else if textField == lastNameField {
            emailField.becomeFirstResponder()
        }
        else if textField == emailField{
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField{
            registerButtontapped()
        }
        
        return true
    }

}

//extension RegisterViewController: UIGestureRecognizerDelegate {
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        return true
//    }
//}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func PresentPhotoActionSheet(){
        let actionSheet = UIAlertController(title:  "Profile Picture",
                                            message: "How would you like to select a picture? ",
                                            preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take Photo",
                                            style: .default,
                                            handler: {[weak self] _ in
            self?.presentCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose Photo",
                                            style: .default,
                                            handler: {[weak self]_ in self?.presentPhotoPicker()}))
        present(actionSheet, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // later
        
        picker.dismiss(animated: true, completion: nil)
        print(info)
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as?  UIImage else{ return }
        self.сhangeImageView.image = selectedImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func presentCamera(){
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true )
    }
    func presentPhotoPicker(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true )
    }
}
