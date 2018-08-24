//
//  WritingViewController.swift
//  dear
//
//  Created by MinhoCheon on 2018. 8. 18..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit
import Alamofire

class WritingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var modelWaiting = WaitingLetterModel.WaitingLetterModelSingleTon

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backBtnItem")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backBtnItem")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width-54, height: view.frame.height))
        titleLabel.text = title
        titleLabel.textColor = UIColor(red: 51/255, green: 85/255, blue: 106/255, alpha: 1)
        titleLabel.font = UIFont(name: "Prata-Regular", size: 18)
        self.navigationItem.titleView = titleLabel
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.modelWaiting.arrayList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : WaitingCollectionViewCell! = collectionView.dequeueReusableCell(withReuseIdentifier: "WaitingCell", for: indexPath) as! WaitingCollectionViewCell
        
        let info = self.modelWaiting.arrayList[indexPath.row]
//        cell.title.text = info.senderNickname
        cell.content.text = info.content
        return cell
    }
    
}
