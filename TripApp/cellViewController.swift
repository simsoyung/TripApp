//
//  cellViewController.swift
//  TripApp
//
//  Created by 심소영 on 5/27/24.
//

import UIKit

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
    
}


