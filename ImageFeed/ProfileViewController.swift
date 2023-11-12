import Foundation
import UIKit

final class ProfileViewController: UIViewController {
    
    let profileImageView = UIImageView()
    let name = UILabel()
    let nickname = UILabel()
    let profileDescription = UILabel()
    let logoutButton = UIButton.systemButton(
        with: UIImage(named: "logout_button 1")!,
        target: self,
        action: #selector(didTapButton)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProfile()
    }
}

extension ProfileViewController {
    
    private func loadProfile() {
        let profileImage = UIImage(named: "UserPick")
        profileImageView.image = profileImage
        view.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:20).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true

        name.text = "Екатерина Новикова"
        name.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
        name.textColor = UIColor(named: "YP White")
        view.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20).isActive = true
        name.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor).isActive = true
        
        nickname.text = "@ekaterina_nov"
        nickname.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        nickname.textColor = UIColor(named: "YP Gray")
        view.addSubview(nickname)
        nickname.translatesAutoresizingMaskIntoConstraints = false
        nickname.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 8).isActive = true
        nickname.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor).isActive = true
        
        profileDescription.text = "Hello, world!"
        profileDescription.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        profileDescription.textColor = UIColor(named: "YP White")
        view.addSubview(profileDescription)
        profileDescription.translatesAutoresizingMaskIntoConstraints = false
        profileDescription.topAnchor.constraint(equalTo: nickname.bottomAnchor, constant: 8).isActive = true
        profileDescription.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor).isActive = true
        
        logoutButton.tintColor = .ypRed
        view.addSubview(logoutButton)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
    }
    
    @objc
    private func didTapButton() {
        //Do nothing
    }
}
