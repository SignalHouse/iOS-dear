//
//  HomeViewController.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 17..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var modelLetter = LetterModel.LetterModelSingleTon
    
    @IBOutlet weak var collectionView: UICollectionView!
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
        
        getTimeInterval()
    }
    
    // 시간 계산 (전역으로 돌리기)
    func getTimeInterval() {
        var date1 = Date()
        var date2 = Date(timeIntervalSinceNow: 9 * 60 * 60)
        
        let formatdate = DateFormatter()
        formatdate.dateFormat = "yyyy/MM/dd HH:mm:ss"
        formatdate.locale = Locale(identifier: "ko_KR")
        
        var diffsec = date2.timeIntervalSince(date1)
        print(diffsec)
        print(formatdate.string(from: date1))
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
            
            headerView.countLetterLabel.text = "\(self.modelLetter.arrayList.count)"
            return headerView
            
        default:
            fatalError("Unexpected element kind")
        }
    }
    
    // setting Letter
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
            let cell : LetterCollectionViewCell! = collectionView.dequeueReusableCell(withReuseIdentifier: "LetterCell", for: indexPath) as! LetterCollectionViewCell
    
            let info = self.modelLetter.arrayList[indexPath.row]
            cell.title.text = info.senderNickname
            cell.content.text = info.content
            return cell
    }
    
}


