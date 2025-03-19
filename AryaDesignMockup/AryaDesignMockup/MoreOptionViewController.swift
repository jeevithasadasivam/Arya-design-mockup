//
//  MoreOptionViewController.swift
//  AryaDesignMockup
//
//  Created by Jeevitha S on 18/03/2025.
//

import UIKit

class MoreOptionViewController: UIViewController {

    @IBOutlet weak var moreOptionTableView: UITableView!
    let cellId = "moreOptionCell"
    var moreOptionList = ["Camera", "Photos", "Files", "Audio"]
    var gradientColor = [[UIColor.gradientGrey.cgColor, UIColor.gradientDarkGrey.cgColor], [UIColor.gradientYellow.cgColor, UIColor.gradientOrange.cgColor], [UIColor.gradientGreen.cgColor, UIColor.gradientBeach.cgColor], [UIColor.gradientPurple.cgColor, UIColor.gradientBlue.cgColor]]

    @IBAction func dissmissView(_ sender: Any) {
        dismiss(animated: true)
    }

    lazy var blurredView: UIView = {
        let containerView = UIView()
        let blurEffect = UIBlurEffect(style: .light)
        let customBlurEffectView = CustomVisualEffectView(effect: blurEffect, intensity: 0.2)
        customBlurEffectView.frame = self.view.bounds
        let dimmedView = UIView()
        dimmedView.backgroundColor = .black.withAlphaComponent(0.6)
        dimmedView.frame = self.view.bounds
        
        containerView.addSubview(customBlurEffectView)
        containerView.addSubview(dimmedView)
        return containerView
    }()

    
    func setupView() {
        view.addSubview(blurredView)
        view.sendSubviewToBack(blurredView)
        view.bringSubviewToFront(moreOptionTableView)
    }

}

// MARK: - View Life Cycle
extension MoreOptionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupView()
    }
}

// MARK: - Table view data source and delegate
extension MoreOptionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moreOptionList.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MoreOptionCell
        cell.optionImage.image = UIImage(named: moreOptionList[indexPath.row])
        cell.textLbl.text = moreOptionList[indexPath.row]
        cell.gradientLayer.locations = [0.0, 1.0]
        cell.gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        cell.gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        cell.gradientLayer.colors = gradientColor[indexPath.row]
        cell.gradientLayer.frame = cell.optionImageBgView.bounds
        cell.optionImageBgView.layer.insertSublayer(cell.gradientLayer, at: 0)

        return cell
    }
    
}

