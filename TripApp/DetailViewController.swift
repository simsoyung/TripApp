//
//  DetailViewController.swift
//  TripApp
//
//  Created by 심소영 on 5/29/24.
//

import UIKit
import StoreKit

class DetailViewController: UIViewController {

    
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    @IBOutlet var textView: UITextView!
    @IBOutlet var checkButton: UIButton!
    
    var contents: Travel?
    let placeholder = "가보고 싶은 여행지를 적어주세요!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = contents?.title
        let back = UIBarButtonItem(image: .init(systemName: "back"), style: .plain, target: self, action: #selector(tappedBack))
        navigationItem.backBarButtonItem = back
        mainLabel.text = contents?.description
        mainLabel.textAlignment = .center
        let url = URL(string: contents?.travel_image ?? "")
        mainImage.kf.setImage(with: url)
        textView.delegate = self
        textView.font = DetailFont.textView
        textView.text = placeholder
        textView.textColor = .lightGray
        subLabel.text = "여행지 추천"
        checkButton.setCheckButton()
        checkButton.addTarget(self, action: #selector(tappedCheckButton), for: .touchUpInside)

    }
    @objc
    func tappedCheckButton(){
            // 1. 바탕등을 구성
            // 만약 actionSheet로 타이틀을 넣기 싫으면 nil을 넣으면 공간 차지도 안된다.
            let alert = UIAlertController(
                title: "여행지 정보 등록", //제일 위에 굵은 글자 타이틀
                message: "여행지 정보가 등록되었습니다", // 그 아래 조금 작은 본문
                preferredStyle: .alert) //actionSheet으로 할래? alert으로 할래 스타일은?
            // 2. 버튼 등을 만들기
            let open = UIAlertAction(title: "확인", style: .default)
            let cancel = UIAlertAction(title: "취소", style: .destructive)
            // 3. 만든 바탕과 버튼을 붙여주기 (순서대로 구성됨)
            //addAction이 붙여주는 역할
            alert.addAction(cancel)
            //순서대로 들어가지만 cancel은 무조건 아래로 간다.(두개일경우 취소는 왼쪽으로 자동으로 들어감) 볼드체로 타입이 cancel이다!
            alert.addAction(open)
            // 4. 이제 내가 만든 alert을 띄어줄거고, 애니매이션도 넣을거야
            present(alert, animated: true)
        }
    
    @objc
    func tappedBack(){
        navigationController?.popViewController(animated: true)
    }
}

extension DetailViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == .lightGray {
                textView.text = nil
                textView.textColor = .black
            }
        }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholder
            textView.textColor = .lightGray
        }
    }
    
}

extension DetailViewController: SKStoreProductViewControllerDelegate {
    
}
