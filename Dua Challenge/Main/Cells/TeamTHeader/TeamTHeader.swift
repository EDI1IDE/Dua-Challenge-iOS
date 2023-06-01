//
//  TeamTHeader.swift
//  Dua Challenge
//
//  Created by Muhamed Zahiri on 1.6.23.
//

import UIKit

class TeamTHeader: UITableViewHeaderFooterView {
    
    //MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureAppearance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureAppearance()
    }
    
    //MARK: - Methods
    private func configureAppearance() {
        //Make headers' default background clear
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        self.backgroundView = backgroundView
    }
    
}
