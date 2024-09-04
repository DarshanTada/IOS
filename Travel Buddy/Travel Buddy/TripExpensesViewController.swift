//
//  TripExpensesViewController.swift
//  Travel Buddy
//
//  Created by Admin on 2024-08-17.
//

import UIKit
import CoreData

class TripExpensesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Outlets for UI components
    @IBOutlet weak var expenseNameTextField: UITextField!
    @IBOutlet weak var expenseAmountTextField: UITextField!
    @IBOutlet weak var addExpenseButton: UIButton!
    @IBOutlet weak var expensesTableView: UITableView!
    @IBOutlet weak var totalExpensesLabel: UILabel!
    
    // Variables to store the selected trip and the list of expenses
    var selectedTrip: Trip? // This should be set before navigating to this view
    var expenses: [Expense] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegate and data source for the table view
        expensesTableView.delegate = self
        expensesTableView.dataSource = self
        
        // Fetch the expenses for the selected trip
        fetchExpenses()
        
        // Update the total expenses label if there are any expenses
        if !expenses.isEmpty {
            updateTotalExpenses()
        }
    }
    
    // Action triggered when the 'Add Expense' button is pressed
    @IBAction func addExpenseButtonPressed(_ sender: UIButton) {
        saveExpense()
    }
    
    // Function to save a new expense to Core Data
    func saveExpense() {
        // Validate input fields
        guard let expenseName = expenseNameTextField.text, !expenseName.isEmpty,
              let expenseAmountText = expenseAmountTextField.text, let expenseAmount = Double(expenseAmountText),
              let trip = selectedTrip else {
            showAlert(message: "Please fill in all fields.")
            return
        }
        
        // Get the context from the AppDelegate
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // Create a new expense object
        let newExpense = Expense(context: context)
        newExpense.name = expenseName
        newExpense.amount = expenseAmount
        newExpense.trip = trip
        
        // Save the new expense to Core Data
        do {
            try context.save()
            fetchExpenses()
            updateTotalExpenses()
        } catch {
            print("Error saving expense: \(error)")
        }
    }
    
    // Function to fetch expenses for the selected trip from Core Data
    func fetchExpenses() {
        guard let trip = selectedTrip else { return }
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Expense> = Expense.fetchRequest()
        
        // Set the predicate to fetch expenses related to the selected trip
        fetchRequest.predicate = NSPredicate(format: "trip == %@", trip)
        
        // Execute the fetch request
        do {
            expenses = try context.fetch(fetchRequest)
            expensesTableView.reloadData()
        } catch {
            print("Error fetching expenses: \(error)")
        }
    }
    
    // Function to calculate and update the total expenses label
    func updateTotalExpenses() {
        let total = expenses.reduce(0) { $0 + $1.amount }
        totalExpensesLabel.text = "Total Expenses: \(total)"
    }
    
    // MARK: - TableView DataSource Methods
    
    // Returns the number of rows in the table view (number of expenses)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    // Configures the cell for each row in the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath)
        let expense = expenses[indexPath.row]
        cell.textLabel?.text = expense.name
        cell.detailTextLabel?.text = "\(expense.amount)"
        return cell
    }
    
    // Function to show an alert message
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

