//
//  AddTrip.swift
//  Trip buddy
//
//  Created by Admin on 2024-08-09.
//
import UIKit

class AddTrip: UIViewController {

   
    
    @IBOutlet weak var tripNameTextField: UITextField!
    @IBOutlet weak var destinationTextField: UITextField!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Add Trip"
        self.view.backgroundColor = UIColor(named: "Background Color")
    }
    
    @IBAction func saveTrip(_ sender: UIButton) {
        // Save trip details to Core Data with validation
    }
}
