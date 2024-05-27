//
//  ADTableViewCell.swift
//  TripApp
//
//  Created by 심소영 on 5/27/24.
//

import UIKit

class ADTableViewCell: UITableViewCell {
    
    @IBOutlet var titleADLabel: UILabel!
    @IBOutlet var adButton: UIButton!
    
    
    func configureADCell(data: Travel){
        if data.ad == true {
            titleADLabel.text = data.title
        } else { return }
        adButton.backgroundColor = .white
        adButton.tintColor = .black
        adButton.layer.cornerRadius = 10
        adButton.titleLabel?.text = "AD"
        titleADLabel.font = .boldSystemFont(ofSize: 18)
        titleADLabel.textColor = .black
        titleADLabel.textAlignment = .center
        titleADLabel.numberOfLines = 2
        titleADLabel.layer.cornerRadius = 10
        titleADLabel.backgroundColor = .systemGreen
    }
    
    
}
