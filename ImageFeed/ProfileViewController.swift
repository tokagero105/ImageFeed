import Foundation
import UIKit

final class ProfileViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProfile()
    }
}

extension ProfileViewController {
    
    func loadProfile() {
        let profileImage = UIImage(named: "UserPick")
        let profileImageView = UIImageView()
        profileImageView.image = profileImage
        view.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:20).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true

        let name = UILabel()
        name.text = "Екатерина Новикова"
        name.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
        name.textColor = UIColor(named: "YP White")
        view.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20).isActive = true
        name.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor).isActive = true
        
        let nickname = UILabel()
        nickname.text = "@ekaterina_nov"
        nickname.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        nickname.textColor = UIColor(named: "YP Gray")
        view.addSubview(nickname)
        nickname.translatesAutoresizingMaskIntoConstraints = false
        nickname.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 8).isActive = true
        nickname.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor).isActive = true
        
        let description = UILabel()
        description.text = "Hello, world!"
        description.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        description.textColor = UIColor(named: "YP White")
        view.addSubview(description)
        description.translatesAutoresizingMaskIntoConstraints = false
        description.topAnchor.constraint(equalTo: nickname.bottomAnchor, constant: 8).isActive = true
        description.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor).isActive = true
    }
}
