//
//  TutorialViewController.swift
//  dear
//
//  Created by SoyeonKim on 2018. 8. 9..
//  Copyright © 2018년 ksy. All rights reserved.
//

import UIKit
import BWWalkthrough

class WalkThroughViewController: UIViewController, UIScrollViewDelegate, BWWalkthroughViewControllerDelegate {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
//
//    var pageIndex:[String] = ["01","02","03"]
//    var pageImage:[String] = ["workthrough_1","workthrough_2","workthrough_3"]
//    var pageContent:[String] =
//    ["Dear에서 하루 세번, 익명의 누군가에게\n편지를 통해 속마음을 털어놓을 수 있습니다.",
//     "과거에 편지와 문자를 받기위해 기다리던\n소중한 시간을 기억하며 진심어린 편지를 나눠보세요.",
//     "작성한 편지는 매일 밤 10시\n정각에만 발송됩니다."]
//
//    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
//
//    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // contentLabel 두 줄 가능
//        contentLabel.numberOfLines = 0
//        contentLabel.lineBreakMode = .byWordWrapping
//
//        // label 초기화
//        indexLabel.text = pageIndex[pageControl.currentPage]
//        contentLabel.text = pageContent[pageControl.currentPage]
//
//        // 이미지 설정
//        pageControl.numberOfPages = pageIndex.count
//        for index in 0 ..< pageIndex.count {
//            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
//            frame.size = scrollView.frame.size
//
//            let imgView = UIImageView(frame: frame)
//            imgView.image = UIImage(named:pageImage[index])
//            self.scrollView.addSubview(imgView)
//        }
//        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(pageIndex.count), height: scrollView.frame.size.height)
//        scrollView.delegate = self
//    }
//
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
//        pageControl.currentPage = Int(pageNumber)
//        indexLabel.text = pageIndex[pageControl.currentPage]
//        contentLabel.text = pageContent[pageControl.currentPage]
    let stb: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let walkthrough = stb.instantiateViewController(withIdentifier: "Master") as! BWWalkthroughViewController
    //    let walkthrough = stb.
    
        let page_one = stb.instantiateViewController(withIdentifier: "Walk01")
        let page_two = stb.instantiateViewController(withIdentifier:"Walk02")
        let page_three = stb.instantiateViewController(withIdentifier:"Walk03")
    
    // Attach the pages to the master
    walkthrough.delegate = self
    walkthrough.add(viewController:page_one)
    walkthrough.add(viewController:page_two)
    walkthrough.add(viewController:page_three)
    }
   
    
}
