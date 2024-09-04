//
//  TripList.swift
//  Trip buddy
//
//  Created by Admin on 2024-08-09.
//
import UIKit

class TripList: UITableViewController {

    var trips: [Trip] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Your Trips"
        self.view.backgroundColor = UIColor(named: "Background Color")
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tripCell")
        fetchTrips()
    }

    func fetchTrips() {
        // Fetch trip data from Core Data
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripCell", for: indexPath)
        let trip = trips[indexPath.row]
        cell.textLabel?.text = trip.name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tripDetailVC = storyboard?.instantiateViewController(withIdentifier: "TripDetailViewController") as! TripDetailViewController
        tripDetailVC.trip = trips[indexPath.row]
        self.navigationController?.pushViewController(tripDetailVC, animated: true)
    }
}
