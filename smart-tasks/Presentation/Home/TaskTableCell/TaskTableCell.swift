//
//  TaskTableCell.swift
//  smart-tasks
//
//  Created by Rashid Khan on 08/06/2024.
//

import UIKit

class TaskTableCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}