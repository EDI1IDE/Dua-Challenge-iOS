//
//  TeamTCell.swift
//  Coding Challenge
//
//  Created by Muhamed Zahiri on 31.5.23.
//

import UIKit

class TeamTCell: UITableViewCell {
    
    @IBOutlet weak var teamLogoImgView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamResultsLabel: UILabel!
    
    var item: Team! {
        didSet { setupUI() }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func setupUI() {
        teamLogoImgView.image = item.logo?.resizeImage(size: 40, quality: 0.7)
        teamNameLabel.text = "\(item.name)(\(item.city))"
        teamResultsLabel.text = "\(item.points)"
    }
}
