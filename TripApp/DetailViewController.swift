//
//  DetailViewController.swift
//  TripApp
//
//  Created by 심소영 on 5/29/24.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var mainLabel: UILabel!
    var contents: String?
    var image: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "관광지 화면"
        let back = UIBarButtonItem(image: .init(systemName: "back"), style: .plain, target: self, action: #selector(tappedBack))
        navigationItem.backBarButtonItem = back
        mainLabel.text = contents
        mainLabel.textAlignment = .center
        let url = URL(string: image ?? "")
        mainImage.kf.setImage(with: url)
        mainImage.contentMode = .scaleAspectFill
        mainImage.layer.cornerRadius = 10
    }

    @objc
    func tappedBack(){
        navigationController?.popViewController(animated: true)
    }
}
