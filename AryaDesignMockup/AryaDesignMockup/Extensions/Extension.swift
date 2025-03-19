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
        return label.bounds.size.height + 40
    }
    
    func createMessageJson() -> [MessageJson] {
        let messageJson:[MessageJson] = [MessageJson(text: "Hi John, I hope you are well. I wanted to check in and see if you have a moment to meet with me tomorrow to discuss the project requirements.", isSender: false, timestamp: "10:12 AM"),MessageJson(text: "That would be great. Yes, I will see you on Monday.", isSender: true, timestamp: "1:54 PM")]
        return messageJson
    }
    
    func applyGradient(view: UIView, colors: [UIColor]) -> UIView {
        let view = UIView(frame: view.frame)
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
        return view
    }

    func addBorders(withEdges edges: [UIRectEdge],
                    cornerRadius: CGFloat,
                    view: UIView) {
        view.layer.borderWidth = 1
        view.layer.cornerRadius = cornerRadius
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner]
        
        edges.forEach({ edge in
            switch edge {
            case .left:
                view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
                view.layer.borderColor = UIColor.primaryBlack.withAlphaComponent(0.1).cgColor
            case .right:
                view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
                view.layer.borderColor = UIColor.primaryWhite.withAlphaComponent(0.35).cgColor
            case .top:
                view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
                view.layer.borderColor = UIColor.primaryBlack.withAlphaComponent(0.1).cgColor
            case .bottom:
                view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
                view.layer.borderColor = UIColor.primaryWhite.withAlphaComponent(0.35).cgColor

            default:
                break
            }
        })
    }
    
}
