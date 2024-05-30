//
//  TripViewController.swift
//  TripApp
//
//  Created by 심소영 on 5/27/24.
//

import UIKit

class TripViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var travelTableView: UITableView!
    
    var list = TravelInfo.travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        travelTableView.rowHeight = 150
        travelTableView.delegate = self
        travelTableView.dataSource = self
        
        let xib = UINib(nibName: ADTableViewCell.identifier, bundle: nil)
        travelTableView.register(xib, forCellReuseIdentifier: ADTableViewCell.identifier)
        
        let xib2 = UINib(nibName: TripTableViewCell.identifier, bundle: nil)
        travelTableView.register(xib2, forCellReuseIdentifier: TripTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = list[indexPath.row]
        
        if data.ad {
            guard let cell = travelTableView.dequeueReusableCell(withIdentifier: ADTableViewCell.identifier, for: indexPath) as? ADTableViewCell else {
                return UITableViewCell()
            }
            cell.awakeFromNib()
            cell.configureADCell(data: data)
            return cell
        } else {
            guard let cell = travelTableView.dequeueReusableCell(withIdentifier: TripTableViewCell.identifier, for: indexPath) as? TripTableViewCell else {
                return UITableViewCell()
            }
            
            cell.awakeFromNib()
            cell.configureCell(data: data)
            cell.heartButton.tag = indexPath.row
            let heart = data.like ?? true ? "heart.fill" : "heart"
            let button = UIImage(systemName: heart)
            cell.heartButton.setImage(button, for: .normal)
            cell.heartButton.addTarget(self, action: #selector(heartButtonClicked), for: .touchUpInside)
            cell.layer.cornerRadius = 20

            return cell
        }
        
    }
    
    @objc
    func heartButtonClicked(sender: UIButton){
        list[sender.tag].like?.toggle()
        travelTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = list[indexPath.row]
        if data.ad{
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "ADDetailViewController") as! ADDetailViewController
            let nav = UINavigationController(rootViewController: vc)
            vc.contents = data
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
            
        } else {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
            vc.contents = data
            navigationController?.pushViewController(vc, animated: true)
            
        }
        travelTableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
}
