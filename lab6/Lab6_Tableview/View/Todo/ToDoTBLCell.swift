//
//  ToDoTBLCell.swift
//  Lab6_Tableview
//
//  Created by Admin on 2024-07-06.
//

import UIKit

class ToDoTBLCell: UITableViewCell {

    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    static let identifier = String(describing: ToDoTBLCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(value: String) {
        self.viewBg.layer.cornerRadius = 10
        self.viewBg.backgroundColor = UIColor(red: 209/255, green: 204/255, blue: 255/255, alpha: 1)
        self.lblTitle.text = value
    }
    
}
