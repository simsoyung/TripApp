//
//  TripTableViewCell.swift
//  TripApp
//
//  Created by 심소영 on 5/27/24.
//

import UIKit

class TripTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var travelImage: UIImageView!
    @IBOutlet var gradeLabel: UILabel!
    @IBOutlet var likeLabel: UILabel!
    @IBOutlet var heartButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tripCellLayout()
    }
    
    func tripCellLayout(){
        titleLabel.setMainLabel()
        descriptionLabel.setSubLabel()
        gradeLabel.setGradeLabel()
        likeLabel.setSaveLabel()
        heartButton.setHeartButton()
    }
    
    func configureCell(data: Travel){
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        gradeLabel.text = "(\(String(data.grade ?? 0)))"
        likeLabel.text = "저장 \(String(data.save?.formatted() ?? ""))"
        let url = URL(string: data.travel_image ?? "")
        travelImage.kf.setImage(with: url)
        travelImage.contentMode = .scaleAspectFill
        travelImage.layer.cornerRadius = 10

    }
    
}
