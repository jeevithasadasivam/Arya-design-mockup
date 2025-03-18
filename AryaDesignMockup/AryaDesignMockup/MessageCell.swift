//
//  MessageCell.swift
//  AryaDesignMockup
//
//  Created by Jeevitha S on 18/03/2025.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var readImage: UIImageView!
    @IBOutlet weak var textLbl: UILabel!
    
    @IBOutlet weak var readImageWidth: NSLayoutConstraint!
    @IBOutlet weak var bgViewWidth: NSLayoutConstraint!
    @IBOutlet weak var bgViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var bgViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
