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
    var gradientColor = [[UIColor.gradientGrey, UIColor.gradientDarkGrey], [UIColor.gradientYellow, UIColor.gradientOrange], [UIColor.gradientGreen, UIColor.gradientBeach], [UIColor.gradientPurple, UIColor.gradientBlue]]

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
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MoreOptionCell
        cell.optionImage.image = UIImage(named: moreOptionList[indexPath.row])
        cell.textLbl.text = moreOptionList[indexPath.row]
        Extension().applyGradient(view: cell.optionImage, colors: gradientColor[indexPath.row], isVertical: true)
        return cell
    }
    
    
    
}

