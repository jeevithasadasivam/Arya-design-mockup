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
    
    func applyGradient(view: UIImageView, colors: [UIColor], isVertical: Bool) {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
//    func addTopBorder(with color: UIColor?, andWidth borderWidth: CGFloat, view: UIView, cornerRadius: CGFloat) {
//        let border = UIView()
//        border.backgroundColor = color
//        border.layer.cornerRadius = cornerRadius
//        border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
//        border.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: borderWidth)
//        view.addSubview(border)
//    }
//    
//    func addBottomBorder(with color: UIColor?, andWidth borderWidth: CGFloat, view: UIView, cornerRadius: CGFloat) {
//        let border = UIView()
//        border.backgroundColor = color
//        border.layer.cornerRadius = cornerRadius
//        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
//        border.frame = CGRect(x: 0, y: view.frame.size.height - borderWidth, width: view.frame.size.width, height: borderWidth)
//        view.addSubview(border)
//    }
//    
//    func addLeftBorder(with color: UIColor?, andWidth borderWidth: CGFloat, view: UIView, cornerRadius: CGFloat) {
//        let border = UIView()
//        border.backgroundColor = color
//        border.layer.cornerRadius = cornerRadius
//        border.frame = CGRect(x: 0, y: 0, width: borderWidth, height: view.frame.size.height)
//        border.autoresizingMask = [.flexibleHeight, .flexibleRightMargin]
//        view.addSubview(border)
//    }
//    
//    func addRightBorder(with color: UIColor?, andWidth borderWidth: CGFloat, view: UIView, cornerRadius: CGFloat) {
//        let border = UIView()
//        border.backgroundColor = color
//        border.layer.cornerRadius = cornerRadius
//        border.autoresizingMask = [.flexibleHeight, .flexibleLeftMargin]
//        border.frame = CGRect(x: view.frame.size.width - borderWidth, y: 0, width: borderWidth, height: view.frame.size.height)
//        view.addSubview(border)
//    }
    func addBorders(withEdges edges: [UIRectEdge],
                    withColor color: UIColor,
                    cornerRadius: CGFloat,
                    view: UIView) {
        view.layer.borderColor = color.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = cornerRadius
        edges.forEach({ edge in
            switch edge {
            case .left:
                view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
                
            case .right:
                view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
                
            case .top:
                view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
                
            case .bottom:
                view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
                
            default:
                break
            }
        })
    }
    
}
