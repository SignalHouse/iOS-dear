//
//  WritingViewController.swift
//  dear
//
//  Created by MinhoCheon on 2018. 8. 18..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit

class WritingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var modelLetter = LetterModel.LetterModelSingleTon

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.modelLetter.arrayList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : WaitingCollectionViewCell! = collectionView.dequeueReusableCell(withReuseIdentifier: "WaitingCell", for: indexPath) as! WaitingCollectionViewCell
        
        let info = self.modelLetter.arrayList[indexPath.row]
//        cell.title.text = info.senderNickname
        cell.content.text = info.content
        return cell
    }

}
