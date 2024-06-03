//
//  cellViewController.swift
//  TripApp
//
//  Created by 심소영 on 5/27/24.
//

import UIKit

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
    }
}

protocol IdProtocol: AnyObject {
    static var identifier: String { get }
}

extension UIViewController: IdProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: IdProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UILabel{
    
    func setMainLabel(){
        self.font = .boldSystemFont(ofSize: 15)
        self.textColor = .black
        self.textAlignment = .left
        self.numberOfLines = 0
    }
    
    func setSubLabel(){
        self.font = .boldSystemFont(ofSize: 14)
        self.textColor = .lightGray
        self.textAlignment = .left
        self.numberOfLines = 0
    }
    
    func setGradeLabel(){
        self.font = .boldSystemFont(ofSize: 12)
        self.textColor = .lightGray
        self.textAlignment = .left
        self.numberOfLines = 1
    }
    
    func setSaveLabel(){
        self.font = .boldSystemFont(ofSize: 12)
        self.textColor = .lightGray
        self.textAlignment = .left
        self.numberOfLines = 1
    }
    
}

extension UIButton{
    
    func setHeartButton(){
        self.backgroundColor = .clear
        self.tintColor = .white
    }
    
    func setCheckButton(){
        self.backgroundColor = UIColor(red: 177/255, green: 158/255, blue: 255/255, alpha: 1.0)
        self.tintColor = .darkGray
        self.titleLabel?.font = .boldSystemFont(ofSize: 14)
        self.titleLabel?.text = "확인!"
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.darkGray.cgColor
    }
    
}

extension UIImageView{
    
    func travelImage(){
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.layer.cornerRadius = 30
        self.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMaxYCorner)
    }
}
