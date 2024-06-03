//
//  ADTableViewCell.swift
//  TripApp
//
//  Created by 심소영 on 5/27/24.
//

import UIKit

class ADTableViewCell: UITableViewCell {
    
    @IBOutlet var titleADLabel: UILabel!
    @IBOutlet var adLabel: UILabel!
    
    func configureADCell(data: Travel){
        if data.ad == true {
            titleADLabel.text = data.title
        } else { return }
        adLabel.backgroundColor = .white
        adLabel.tintColor = .black
        adLabel.layer.cornerRadius = 20
        adLabel.text = "AD"
        adLabel.font = .boldSystemFont(ofSize: 12)
        adLabel.textAlignment = .center
        
        titleADLabel.font = .boldSystemFont(ofSize: 18)
        titleADLabel.textColor = .black
        titleADLabel.textAlignment = .center
        titleADLabel.numberOfLines = 2
        titleADLabel.layer.cornerRadius = 20
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .white
        titleADLabel.backgroundColor = nil
    }
    
}
