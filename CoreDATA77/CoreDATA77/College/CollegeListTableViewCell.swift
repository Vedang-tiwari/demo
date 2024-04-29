//
//  CollegeListTableViewCell.swift
//  CoreDataDemo1
//
//  Created by Students on 24/04/24.
//

import UIKit

class CollegeListTableViewCell: UITableViewCell {
 
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
