//
//  SpaceCell.swift
//  smart-tasks
//
//  Created by Rashid Khan on 09/06/2024.
//

import UIKit

class SpaceCell: TableViewCell {
    @IBOutlet weak var cellHeight: UIView!
    
    private var presenter: SpaceCellPresenterType!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
    
    override func configure(presenter: ReusableViewPresenterType) {
        let presenter = presenter as? SpaceCellPresenterType
        
    }
}
