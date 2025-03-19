//
//  MoreOptionCell.swift
//  AryaDesignMockup
//
//  Created by Jeevitha S on 18/03/2025.
//

import UIKit

class MoreOptionCell: UITableViewCell {
    @IBOutlet weak var optionImageBgView: UIView!
    @IBOutlet weak var optionImage: UIImageView!
    @IBOutlet weak var textLbl: UILabel!
    var gradientLayer: CAGradientLayer = CAGradientLayer()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textLbl.font = UIFont(name: InterFont.regular, size: 16)
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        if optionImageBgView.layer.sublayers?[0] is CAGradientLayer {
            gradientLayer.frame = self.bounds
        }
    }


}
