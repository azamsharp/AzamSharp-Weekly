import UIKit
import PlaygroundSupport


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        
        let usernameLabel = UILabel()
        usernameLabel.text = "User name"
        usernameLabel.font = UIFont(name: "Arial", size: 14)
        
        let usernameTextField = UITextField()
        usernameTextField.borderStyle = .roundedRect
        
        let passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont(name: "Arial", size: 14)
        
        let passwordTextField = UITextField()
        passwordTextField.borderStyle = .roundedRect
        
        let loginButton = UIButton(type: .roundedRect)
        loginButton.setTitle("Login", for: .normal)
        
        let stackView = UIStackView(arrangedSubviews: [usernameLabel, usernameTextField, passwordLabel, passwordTextField, loginButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        self.view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        
    }
    
}

let vc = ViewController()
vc.view.backgroundColor = UIColor.white

PlaygroundPage.current.liveView = vc





