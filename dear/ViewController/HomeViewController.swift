//
//  HomeViewController.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 17..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyTimer

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var modelLetter = LetterModel.LetterModelSingleTon
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var remainCountLabel: UILabel!
    var timeArr:Array<String> = []
    var isEditClicked:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigationBar init
        let logoImage = UIImage.init(named: "smallLogo")
        let logoImageView = UIImageView.init(image: logoImage)
        logoImageView.frame = CGRect(x:0.0,y:0.0, width:52,height:21)
        logoImageView.contentMode = .scaleAspectFit
        let imageItem = UIBarButtonItem.init(customView: logoImageView)
        let widthConstraint = logoImageView.widthAnchor.constraint(equalToConstant: 60)
        let heightConstraint = logoImageView.heightAnchor.constraint(equalToConstant: 25)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
        navigationItem.leftBarButtonItem =  imageItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collectionView.reloadData()
    }

    
    func calculateTimeDifference() -> Array<String> {
        var arr:Array<String> = []
        
        // 현재 날짜, 포매터 설정
        var currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HHmm"
        formatter.locale = Locale(identifier: "ko_KR")
        
        var startString = formatter.string(from: currentDate)
        
        if startString.count < 4 {
            for _ in 0..<(4 - startString.count) {
                startString = "0" + startString
            }
        }
        
        // 매일 10시
        var endString = "\(2200)"
        if endString.count < 4 {
            for _ in 0..<(4 - endString.count) {
                endString = "0" + endString
            }
        }
        
        let startDate = formatter.date(from: startString)!
        let endDate = formatter.date(from: endString)!
        let difference = endDate.timeIntervalSince(startDate)
        
        arr.append(String(Int(difference) / 3600))
        arr.append(String(Int(difference) % 3600 / 60))
        
        return arr
    }
    
    /* collectionview setting */
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.modelLetter.arrayList.count
    }
    
    // For header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:collectionView.frame.size.width, height:340.0)
    }
    
    // setting Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionElementKindSectionHeader:
            
            let headerView:HomeHeaderCollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeadView", for: indexPath) as! HomeHeaderCollectionReusableView
            
            // 편지지 개수
            headerView.countLetterLabel.text = "\(self.modelLetter.arrayList.count)"
            
            // 남은 시간
            timeArr = calculateTimeDifference()
            headerView.hourIntervalLabel.text = timeArr[0]
            headerView.minuetIntervalLabel.text = timeArr[1]
            
            // 편집 가능하도록
            headerView.editLetterButton.addTarget(self, action: #selector(HomeViewController.editButtonPressed(_:)), for: UIControlEvents.touchUpInside)
            
            headerView.reloadInputViews()
            
            return headerView
            
        default:
            fatalError("Unexpected element kind")
        }
    }
    
    // 편집 버튼 눌렀을 때 액션 추가
    @objc func editButtonPressed(_ btn :UIButton) {
        isEditClicked = !isEditClicked
    }
    
    @objc func deleteLetter(_ sender :UIButton) {
        
    }
    
    // setting Letter
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : LetterCollectionViewCell! = collectionView.dequeueReusableCell(withReuseIdentifier: "LetterCell", for: indexPath) as! LetterCollectionViewCell
        let info = self.modelLetter.arrayList[indexPath.row]
        cell.checkButton?.isHidden = !isEditClicked
        cell.checkButton?.addTarget(self, action: #selector(self.deleteLetter(_:)), for: UIControlEvents.touchUpInside)
        
        if (info.isNew) {
            cell.title.isHidden = true
            cell.content.isHidden = true
            cell.recentLabel.isHidden = true
            cell.underline.isHidden = true
            cell.backImg.isHighlighted = true
        }
        else
        {
            cell.title.isHidden = false
            cell.content.isHidden = false
            cell.recentLabel.isHidden = false
            cell.underline.isHidden = false
            cell.title.text = info.senderNickname
            cell.content.text = info.content
            cell.backImg.isHighlighted = false
        }
            return cell
    }
    
    // 채팅 대상 닉네임 넘겨주기 (title, cell)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toChatView"
        {
            let dest = segue.destination as! ChatViewController
            let cell = sender as! UICollectionViewCell
            let indexPath: IndexPath! =  self.collectionView.indexPath(for: cell)
            dest.title =  modelLetter.arrayList[indexPath.row].senderNickname
            dest.otherNickname = modelLetter.arrayList[indexPath.row].senderNickname
            modelLetter.arrayList[indexPath.row].isNew = false
        }
    }
    
}


