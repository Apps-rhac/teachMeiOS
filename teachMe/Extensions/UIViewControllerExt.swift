import UIKit
import Firebase

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func presentMainTabBarController(gateway:AuthenticationGateway, presenter:Presenter, dataStore:DataStore) {
        let mainTabBarVC = MainTabBarVC(gateway: gateway, presenter: presenter, dataStore:dataStore )
        self.present(mainTabBarVC, animated: true, completion: nil)
    }
}
