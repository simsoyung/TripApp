//
//  ADDetailViewController.swift
//  TripApp
//
//  Created by 심소영 on 5/29/24.
//

import UIKit
import MapKit

class ADDetailViewController: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet var mainADLabel: UILabel!
    @IBOutlet var sesacMap: MKMapView!
    
    var contents: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "광고 화면"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))
        mainADLabel.text = "올 여름 휴가는 영등포 캠퍼스로!!"
        mainADLabel.setMainLabel()
        sesacMap.delegate = self
        let center = CLLocationCoordinate2D(latitude: 37.517742, longitude: 126.886463)
        sesacMap.region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = "새싹 영등포 캠퍼스"
        sesacMap.addAnnotation(annotation)
    }
    
    @objc
    func closeButtonClicked(){
        self.dismiss(animated: true)
    }
}

