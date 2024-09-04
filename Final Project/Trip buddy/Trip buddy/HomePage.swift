//
//  HomePageViewController.swift
//  Trip buddy
//
//  Created by Admin on 2024-08-09.
//
import UIKit

class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Travel Buddy"
        self.view.backgroundColor = UIColor(named: "Background Color")
    }

    @IBAction func addTrip(_ sender: UIButton) {
        let addTripVC = storyboard?.instantiateViewController(withIdentifier: "AddTrip") as! AddTrip
        self.navigationController?.pushViewController(addTripVC, animated: true)
    }
}
