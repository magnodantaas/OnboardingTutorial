//
//  HomeController.swift
//  OnboardingTutorial
//
//  Created by Magno Miranda Dantas on 16/06/21.
//

import UIKit
import Firebase

class HomeController: UIViewController {
    
    // MARK: - Properties
    
    private var shouldShowOnboarding = true
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticateUser()
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func handleLogout() {
        let alert = UIAlertController(title: nil, message: MSG_ALERT_LOGOUT,
                                      preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: MSG_LOGOUT,
                                      style: .destructive,
                                      handler: { _ in
            self.logout()
        }))
        
        alert.addAction(UIAlertAction(title: MSG_CANCEL,
                                      style: .cancel,
                                      handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - API
    
    func authenticateUser() {
        if Auth.auth().currentUser?.uid == nil {
            DispatchQueue.main.async {
                self.presentLoginController()
            }
        } else {
            if shouldShowOnboarding {
                presentOnboardingController()
            }
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            presentLoginController()
        } catch {
            print("DEBUG: Error Signin Out..")
        }
    }
    
    fileprivate func presentLoginController() {
        let controller = LoginController()
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
    }
    
    fileprivate func presentOnboardingController() {
        let controller = OnboardingController()
        controller.delegate = self
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        configureGradientBackground()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Firebase Login"
        
        let image = UIImage(systemName: "arrow.left")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleLogout))
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
}

extension HomeController: OnboardingControllerDelegate {
    func controllerWantsToDismiss(_ controller: OnboardingController) {
        controller.dismiss(animated: true, completion: nil)
        shouldShowOnboarding.toggle()
    }
}
