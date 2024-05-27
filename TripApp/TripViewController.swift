//
//  TripViewController.swift
//  TripApp
//
//  Created by 심소영 on 5/27/24.
//

import UIKit

class TripViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var travelTableView: UITableView!
    
    var list = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        travelTableView.rowHeight = 130
        travelTableView.delegate = self
        travelTableView.dataSource = self
        
        let xib = UINib(nibName: "ADTableViewCell", bundle: nil)
        travelTableView.register(xib, forCellReuseIdentifier: "ADTableViewCell")
        
        let xib2 = UINib(nibName: "TripTableViewCell", bundle: nil)
        travelTableView.register(xib2, forCellReuseIdentifier: "TripTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ADCell = travelTableView.dequeueReusableCell(withIdentifier: "ADTableViewCell", for: indexPath) as! ADTableViewCell
        let travelCell = travelTableView.dequeueReusableCell(withIdentifier: "TripTableViewCell", for: indexPath) as! TripTableViewCell
        
        let data = list[indexPath.row]
        travelCell.configureCell(data: data)
        travelCell.awakeFromNib()
        ADCell.configureADCell(data: data)
        ADCell.awakeFromNib()
        
        let like = data.like ?? false ? "heart.fill" : "heart"
        let button = UIImage(systemName: like)
        travelCell.heartButton.setImage(button, for: .normal)
        
        travelCell.heartButton.tag = indexPath.row
       // travelCell.heartButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        var tripList: [Travel] = []
        for item in tripList {
            if item.ad == true{
                tripList.append(item)
                return ADCell
            } else {
                print("정보가 없습니다.")
            }
            list = tripList
            travelTableView.reloadData()
        }
        return travelCell
    }
}
