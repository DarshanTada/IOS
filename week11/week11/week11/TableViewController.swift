//
//  TableViewController.swift
//  week11
//
//  Created by Admin on 2024-07-23.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBAction func addPerson(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Person", message: "What is their name", preferredStyle: .alert)
        
        alert.addTextField{ (textField1) in textField1.placeholder = "Name"
        }
        alert.addTextField{ (textField2) in textField2.placeholder = "Age"
        }
        alert.addTextField{ (textField3) in textField3.placeholder = "Hair Color"
        }
        
        let submitButton = UIAlertAction(title: "Add", style: .default) {
             (action) in
            
            let textField = alert.textFields![0]
            let ageField = alert.textFields![1]
            let hairField = alert.textFields![2]
            
            
            let newPerson = Person(context: self.content)
            newPerson.name = textField.text
            newPerson.age = ageField.text
            newPerson.hairColor = hairField.text
            
            do {
                try self.content.save()
            } catch {
                print("Error saving data")
            }
            
            self.fetchPeople()
            
        }
        
        alert.addAction(submitButton)
        
        self.present(alert, animated: true, completion: nil)
        
    
    }
    
    
//    @IBOutlet var myFamilyList: UITableView!
    
    
    @IBOutlet weak var myFamilyList: UITableView!
    
    var family: [Person]?
    let content = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        

        myFamilyList.delegate = self
        myFamilyList.dataSource = self
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
       fetchPeople()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "personCell")
    }
    
    func fetchPeople() {
        do{
            self.family = try content.fetch(Person.fetchRequest())
            DispatchQueue.main.async {
                self.myFamilyList.reloadData()
            }
        } catch {
            print("no data")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
   
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.family?.count ?? 0
    }
    
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
