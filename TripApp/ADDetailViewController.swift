//
//  ADDetailViewController.swift
//  TripApp
//
//  Created by 심소영 on 5/29/24.
//

import UIKit

class ADDetailViewController: UIViewController {
    
    @IBOutlet var ADmainLabel: UILabel!
    var contents: String?
    var image: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "광고 화면"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))
        ADmainLabel.text = contents
        ADmainLabel.textAlignment = .center
    }
    
    @objc
    func closeButtonClicked(){
        self.dismiss(animated: true)
    }
}
