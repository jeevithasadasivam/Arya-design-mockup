//
//  Extension.swift
//  Arya Messaging
//
//  Created by Jeevitha S on 17/03/2025.
//

import Foundation
import UIKit

class Extension {
    
    func heightForView(text:String, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = UIFont(name: InterFont.regular, size: 14)!
        label.text = text
        label.sizeToFit()
        return label.bounds.size.height
    }
    
    func createMessageJson() -> [MessageJson] {
        let messageJson:[MessageJson] = [MessageJson(text: "Hi John, I hope you are well. I wanted to check in and see if you have a moment to meet with me tomorrow to discuss the project requirements.", isSender: true, timestamp: "10:12 AM"),MessageJson(text: "That would be great. Yes, I will see you on Monday.", isSender: true, timestamp: "1:54 PM")]
        return messageJson
    }
    
    func applyGradient(view: UIView, colors: [UIColor], isVertical: Bool) {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

}
