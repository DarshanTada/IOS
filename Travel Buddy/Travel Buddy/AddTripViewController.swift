//
//  AddTripViewController.swift
//  Travel Buddy
//
//  Created by Admin on 2024-08-17.
//
//
//  AddTripViewController.swift
//  Travel Buddy
//
//  Created by Admin on 2024-08-17.
//

import UIKit
import CoreData

// This view controller allows the user to add a new trip, with fields for the trip name,
// destination, starting location, and dates. The trip data is saved to Core Data.
class AddTripViewController: UIViewController {
    
    // Outlets for the UI elements in the Add Trip screen.
    @IBOutlet weak var tripNameTextField: UITextField!
    @IBOutlet weak var destinationTextField: UITextField!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var startingLocationTextField: UITextField! // New Outlet for Starting Location
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional setup after loading the view can be done here if needed.
    }
    
    // Action for the Save button, triggers the saveTripData() function.
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        saveTripData()
    }
    
    // Action for the Reset button, triggers the resetFields() function.
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        resetFields() // Call the reset function when the reset button is pressed
    }
    
    // This function handles saving the trip data to Core Data.
    func saveTripData() {
        // Ensure all fields are filled in before saving.
        guard let tripName = tripNameTextField.text, !tripName.isEmpty,
              let destination = destinationTextField.text, !destination.isEmpty,
              let startingLocation = startingLocationTextField.text, !startingLocation.isEmpty else {
            showAlert(message: "Please fill in all fields.") // Show an alert if fields are missing.
            return
        }
        
        // Get the Core Data context.
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        // Create a new Trip object.
        let newTrip = Trip(context: context)
        // Set the properties of the new trip.
        newTrip.name = tripName
        newTrip.destination = destination
        newTrip.startingLocation = startingLocation // Save Starting Location
        newTrip.startDate = startDatePicker.date
        newTrip.endDate = endDatePicker.date
        
        do {
            try context.save() // Attempt to save the new trip to Core Data.
            showAlert(message: "Trip saved successfully.") // Show success message.
        } catch {
            print("Error saving trip: \(error)") // Log an error message if saving fails.
        }
    }
    
    // This function resets all input fields to their default states.
    func resetFields() {
        tripNameTextField.text = ""
        destinationTextField.text = ""
        startingLocationTextField.text = ""
        startDatePicker.date = Date() // Reset the start date picker to the current date.
        endDatePicker.date = Date() // Reset the end date picker to the current date.
    }
    
    // This function displays an alert with the given message.
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Action for the Back button, dismisses the current view controller.
    @IBAction func btnBackPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
