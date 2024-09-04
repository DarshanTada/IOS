//
//  TripListViewController.swift
//  Travel Buddy
//
//  Created by Admin on 2024-08-17.
//
import UIKit
import CoreData

// This class manages the list of trips, displaying them in a table view,
// allowing for search and deletion, and navigating to a trip's detail view.
class TripListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    // Outlets for the table view and search bar in the UI.
    @IBOutlet weak var tripsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Arrays to hold the list of trips and the filtered list when searching.
    var trips: [Trip] = []
    var filteredTrips: [Trip] = []
    var isSearching = false  // Boolean to track if the user is currently searching.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegates for the table view and search bar.
        tripsTableView.delegate = self
        tripsTableView.dataSource = self
        searchBar.delegate = self
        
        // Optionally register a custom cell if used.
//        let nib = UINib(nibName: "TripTableViewCell", bundle: nil)
//        tripsTableView.register(nib, forCellReuseIdentifier: "tripCell")
        
        // Fetch the list of trips from Core Data.
        fetchTrips()
    }
    
    // Fetches the trips from Core Data and reloads the table view.
    func fetchTrips() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Trip> = Trip.fetchRequest()
        
        do {
            trips = try context.fetch(fetchRequest)
            filteredTrips = trips  // Initially, filteredTrips is the same as trips.
            tripsTableView.reloadData()
        } catch {
            print("Error fetching trips: \(error)")  // Log an error message if fetching fails.
        }
    }
    
    // MARK: - TableView DataSource Methods
    
    // Returns the number of rows for the table view, depending on whether the user is searching.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredTrips.count : trips.count
    }
    
    // Configures each cell in the table view with the trip's name and destination.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripCell", for: indexPath)
        
        let trip = isSearching ? filteredTrips[indexPath.row] : trips[indexPath.row]
        cell.textLabel?.text = trip.name
        cell.detailTextLabel?.text = trip.destination
        
        return cell
    }
    
    // MARK: - TableView Delegate Methods
    
    // Handles the selection of a row, navigating to the detail view of the selected trip.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTrip = isSearching ? filteredTrips[indexPath.row] : trips[indexPath.row]
        redirectToTripDetail(tripValue: selectedTrip)
    }
    
    // MARK: - Deleting a Trip
    
    // Enables swipe-to-delete functionality for the table view cells.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let tripToDelete = isSearching ? filteredTrips[indexPath.row] : trips[indexPath.row]
            confirmDeletion(for: tripToDelete, at: indexPath)
        }
    }
    
    // Presents an alert to confirm the deletion of a trip.
    func confirmDeletion(for trip: Trip, at indexPath: IndexPath) {
        let alert = UIAlertController(title: "Delete Trip", message: "Are you sure you want to delete this trip?", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
            self.deleteTrip(trip, at: indexPath)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    // Deletes the trip from Core Data and updates the table view.
    func deleteTrip(_ trip: Trip, at indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(trip)
        
        do {
            try context.save()
            // Remove the trip from the arrays and update the table view.
            trips.removeAll { $0 == trip }
            filteredTrips.removeAll { $0 == trip }
            tripsTableView.deleteRows(at: [indexPath], with: .fade)
        } catch {
            print("Error deleting trip: \(error)")  // Log an error message if deletion fails.
        }
    }
    
    // MARK: - Search Bar Delegate Methods
    
    // Filters the trips based on the search query entered by the user.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            filteredTrips = trips  // If the search bar is empty, show all trips.
        } else {
            isSearching = true
            filteredTrips = trips.filter { $0.name?.lowercased().contains(searchText.lowercased()) == true }
        }
        tripsTableView.reloadData()  // Reload the table view with the filtered results.
    }
    
    // MARK: - Navigation
    
    // Navigates to the TripDetailViewController to display the details of the selected trip.
    func redirectToTripDetail(tripValue: Trip) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "TripDetailViewController") as! TripDetailViewController
        viewController.trip = tripValue
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    // Action for the back button, dismissing the current view controller.
    @IBAction func btnBackPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
