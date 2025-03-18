//
//  ViewController.swift
//  AryaDesignMockup
//
//  Created by Jeevitha S on 18/03/2025.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var navView: UIView!
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var plusButton: UIButton!
    
    // MARK: - Properties
    var messageJson : [MessageJson] = Extension().createMessageJson()
    let cellId = "messageCell"
    
    // MARK: - Button Actions
    @IBAction func plusButtonTapped(_ sender: Any) {
        showMoreOptionView()
    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        
    }
    
    
    
}

// MARK: - View Life Cycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //apply Gradient Color to the Bg view
        applyGradientColor()
        
        
    }
}

extension ViewController {

    func applyGradientColor() {
        let gradientLayer = CAGradientLayer()
        let FirstColor =  UIColor(red: 4.0/255.0, green: 141.0/255.0, blue: 245.0/255.0, alpha: 1.0).cgColor
        let secondColor = UIColor(red: 20.0/255.0, green: 168.0/255.0, blue: 246.0/255.0, alpha: 1.0).cgColor
        let thirdColor = UIColor(red: 145.0/255.0, green: 174.0/255.0, blue: 187.0/255.0, alpha: 1.0).cgColor
        let fourthColor = UIColor(red: 251.0/255.0, green: 218.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
        
        // Set the colors and locations for the gradient layer
        gradientLayer.colors = [FirstColor, fourthColor]
        gradientLayer.locations = [0.0, 1.0]
        
        // Set the start and end points for the gradient layer
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        // Set the frame to the layer
        gradientLayer.frame = view.bounds
        
        // Add the gradient layer as a sublayer to the background view
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func addBorderToView(view: UIView, cornerRadius: CGFloat) {
        Extension().addBorders(withEdges: [.left, .top], withColor: UIColor.primaryBlack.withAlphaComponent(0.1), cornerRadius: cornerRadius, view: view)
        Extension().addBorders(withEdges: [.right, .bottom], withColor: UIColor.primaryWhite.withAlphaComponent(0.35), cornerRadius: cornerRadius, view: view)
    }
    
    func showMoreOptionView() {
        if let moreOptionVC = storyboard?.instantiateViewController(identifier: "moreOptionViewController") {
            moreOptionVC.modalPresentationStyle = .overCurrentContext
            moreOptionVC.modalTransitionStyle = .crossDissolve
            present(moreOptionVC, animated: true)
        }

    }
    
}

// MARK: - Table view data source and delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageJson.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MessageCell
        cell.selectionStyle = .none
        cell.textLbl.text = messageJson[indexPath.row].text
        cell.timeLabel.text = messageJson[indexPath.row].timestamp
        cell.bgViewWidth.constant = self.messageTableView.frame.width * 0.75
        cell.bgView.layer.cornerRadius = 14
        if messageJson[indexPath.row].isSender {
            cell.bgViewLeadingConstraint.isActive = false
            cell.readImage.isHidden = false
            cell.textLbl.textColor = UIColor.primaryBlack
            cell.textLbl.backgroundColor = UIColor.primaryWhite
            cell.timeLabel.textColor = UIColor.primaryBlue
            cell.bgView.backgroundColor = UIColor.primaryWhite
        } else {
            cell.bgView.backgroundColor = UIColor.clear
            cell.textLbl.textColor = UIColor.primaryWhite
            cell.timeLabel.textColor = UIColor.primaryWhite
            cell.readImage.isHidden = true
            cell.readImageWidth.constant = 0
            cell.bgViewTrailingConstraint.isActive = false
            addBorderToView(view: cell.bgView, cornerRadius: 14)
        }
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    
    
}
