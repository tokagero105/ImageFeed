import Foundation
import UIKit

final class ProfileViewController: UIViewController {
    
    @IBOutlet var userAvatarImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var nickNameLabel: UILabel!
    @IBOutlet var DescriptionLabel: UILabel!
    
    
    @IBOutlet var logoutButton: UIButton!

    @IBAction func didTapLogoutButton() {
    }
}
