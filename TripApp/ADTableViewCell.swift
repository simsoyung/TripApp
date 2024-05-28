//
//  ADTableViewCell.swift
//  TripApp
//
//  Created by 심소영 on 5/27/24.
//

import UIKit

class ADTableViewCell: UITableViewCell {
    
    static let identifier = "ADTableViewCell"
    
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
        
        if data.ad {
            backgroundColor = UIColor(red: 0.7451, green: 0.898, blue: 0.702, alpha: 1.0)
        } else {
            backgroundColor = .white
            //backgroundColor = UIColor(red: 237/255, green: 236/255, blue: 170/255, alpha: 1.0)
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .white
        titleADLabel.backgroundColor = nil
    }
    
}
