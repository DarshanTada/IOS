//
//  ImagesViewController.swift
//  lab5
//
//  Created by Admin on 2024-06-23.
//

import UIKit

class ImagesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogoutTapped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
              if let welcomeViewController = storyboard.instantiateViewController(withIdentifier: "welcomePage") as? WelcomePageViewController {
                  
                  // Set the welcomeViewController as the root view controller
                  if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                     let sceneDelegate = windowScene.delegate as? UIWindowSceneDelegate,
                     let window = sceneDelegate.window {
                      window?.rootViewController = welcomeViewController
                      
                      // Optionally add a transition animation
                      UIView.transition(with: window!,
                                        duration: 0.5,
                                        options: .transitionCrossDissolve,
                                        animations: nil,
                                        completion: nil)
                  }
              }
    }
    
  

}
