//
//  ProfileViewController.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 20.12.2021.
//

import UIKit
import FirebaseAuth
import FBSDKLoginKit

enum ProfileViewModelType{
    case info, logout
}
struct ProfileViewModel{
    let viewModelType: ProfileViewModelType
    let title: String
//    let color: UIColor
    let handler: (()->Void)?
}

class ProfileViewController: UIViewController {

    var data = [ProfileViewModel]()
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
//        data.append(ProfileViewModel(viewModelType: .info, title: "Photo: \(UserDefaults.standard.value(forKey: "namechat") as? String ?? "no name" )" , handler: nil))
//        
        data.append(ProfileViewModel(viewModelType: .info, title: "Name: \(UserDefaults.standard.value(forKey: "name") as? String ?? "no name" )" , handler: nil))
        data.append(ProfileViewModel(viewModelType: .info, title: "Email: \(UserDefaults.standard.value(forKey: "email") as? String ?? "no email" )" , handler: nil))
        
        
        data.append(ProfileViewModel(viewModelType: .logout, title: "Log  Out" , handler: {[weak self] in
            
            guard let strongSelf  = self else {
                return
            }
            let actionSheet = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
            actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler:{[weak self] _ in
                guard let strongSelf = self else { return }
                
                // log out facebook
                
                FBSDKLoginKit.LoginManager().logOut()
                
                do{
                   try FirebaseAuth.Auth.auth().signOut()
                    
              let vc = LoginViewController()
              let nav = UINavigationController(rootViewController: vc)
              nav.modalPresentationStyle = .fullScreen
                    strongSelf.present(nav, animated: true)
                         
                }
                catch{
                    print("Failed to log out")
                }
            }))
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
             strongSelf.present(actionSheet, animated: true)
        }))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = createTableHeader()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    func createTableHeader()->UIView?{
        guard let email = UserDefaults.standard.value(forKey: "email") as? String else  { return nil }
        let safeEmail =  DatabaseManager.safeEmail(emailAddress: email)
        let fileName = safeEmail + "_profile_picture.png"
        let path = "images/" + fileName
        
        let headerView = UIView(frame: CGRect(x: 0,
                                        y: 0,
                                        width: self.view.width,
                                        height: 300))
        
        let imageView = UIImageView(frame: CGRect(x:(view.width-150)/2, y: 75 , width: 150, height: 150))
        
        imageView.backgroundColor = .white
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        headerView.addSubview(imageView)
        
        StorageManager.shared.downloadUrl(for: path, completion: { result in
            switch result{
            case .success(let url):
                self.downloadImageView(imageView: imageView, url: url)
            case .failure(let error):
                 print("Failed to get download \(error)")
            }
        })
        return headerView
    }
    func downloadImageView(imageView: UIImageView, url: URL ){
        URLSession.shared.dataTask(with: url, completionHandler: {data, _ ,error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                imageView.image = image
            }
        }).resume()
    }
}
extension ProfileViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for : indexPath) as! ProfileTableViewCell
        cell.setUp(with: viewModel)
//        cell.textLabel?.text = data[indexPath.row]
//        cell.textLabel?.textAlignment = .center
//        cell.textLabel?.textColor = .red
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.row].handler?()
        
//        let actionSheet = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
//        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler:{[weak self] _ in
//            guard let strongSelf = self else { return }
//
//            // log out facebook
//
//            FBSDKLoginKit.LoginManager().logOut()
//
//            do{
//               try FirebaseAuth.Auth.auth().signOut()
//
//          let vc = LoginViewController()
//          let nav = UINavigationController(rootViewController: vc)
//          nav.modalPresentationStyle = .fullScreen
//                strongSelf.present(nav, animated: true)
//
//            }
//            catch{
//                print("Failed to log out")
//            }
//        }))
//        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//        present(actionSheet, animated: true)
        

    }
}

class ProfileTableViewCell:  UITableViewCell{
    
    static let identifier = "ProfileTableViewCell"
    public func setUp(with viewModel: ProfileViewModel){
        
        self.textLabel?.text = viewModel.title

        switch viewModel.viewModelType{
        case .info:
            self.textLabel?.textAlignment = .left

        case .logout:
            self.textLabel?.textColor = .red
            self.textLabel?.textAlignment = .center
            
        }
    }
}
