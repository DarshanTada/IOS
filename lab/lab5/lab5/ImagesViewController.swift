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
        
        //        alert to confirm logout action
                let alert = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: .alert)
                        let OKAction = UIAlertAction(title: "Yes", style: .default) { (action) in
        //                    print("Logout Sucessufull")
                            self.dismiss(animated: true, completion: nil)
                            
                        }

                        let CancelAction = UIAlertAction(title: "Cancel", style: .default) { (action) in
        //                    print("Logout Cancel")
                        }
                        alert.addAction(OKAction)
                        alert.addAction(CancelAction)
                        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is WelcomePageViewController {
        let welcomePageViewController = segue.destination as? WelcomePageViewController
            welcomePageViewController?.logout = "yes"
        }
    }

    
  

}
