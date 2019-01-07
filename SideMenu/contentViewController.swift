//
//  ViewController.swift
//  SideMenu
//
//  Created by 김진형 on 2018. 7. 13..
//  Copyright © 2018년 김진형. All rights reserved.
//

import UIKit

class contentViewController: UIViewController {

    var navigationVC: UIViewController?
    var sideVC: UIViewController?
    
    var isSideShowing = false
    
    let SLID_TIME = 0.3
    let SLIDING_WIDTH:CGFloat = 260
    
    func setupView() {
        //frontView를 초기 뷰로 지정하는 과정
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "side_front") as? UINavigationController {
            //navigationController의 속성정보가 vc에 들어가 있는것,
            //frontViewController에 대한 정보를 담기 위해 vc의 0번째 인덱스(root View) 속성을 넣어준다.
            
            let frontVC = vc.viewControllers[0] as? FrontViewController
            frontVC?.delegate = self
            
            self.navigationVC = vc
            
            self.addChildViewController(vc)
            self.view.addSubview(vc.view)
            
            vc.didMove(toParentViewController: self)
            
        }
    }
    
    func getSideView() {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "side_menu") {
            
            self.sideVC = vc
            self.addChildViewController(vc)
            self.view.addSubview(vc.view)
            
            vc.didMove(toParentViewController: self)
            
            self.view.bringSubview(toFront: (self.navigationVC?.view)!)
        }
    }
    
    func shadowEffect(shadow: Bool, offset: CGFloat) {
        if shadow == true {
            navigationVC?.view.layer.shadowRadius = 10  //모서리 둥글기
            navigationVC?.view.layer.shadowOpacity = 0.7    //그림자 투명도
            navigationVC?.view.layer.shadowOffset = CGSize(width: offset, height: offset) //그림자 크기
            navigationVC?.view.layer.shadowColor = UIColor.black.cgColor // 그림자 색상
        } else {
            navigationVC?.view.layer.shadowRadius = 0.0
            navigationVC?.view.layer.shadowOffset = CGSize(width: offset, height: offset)
        }
    }
    
    func openSideMenu() {
        let options = UIViewAnimationOptions([.curveEaseInOut, .beginFromCurrentState])
        
        self.getSideView()
        self.shadowEffect(shadow: true, offset: -2)
        
        UIView.animate(withDuration: TimeInterval(self.SLID_TIME), delay: TimeInterval(0), options: options, animations: {
            
            self.navigationVC?.view.frame = CGRect(x: self.SLIDING_WIDTH, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            
            
        }, completion: {
            if $0 == true {
                self.isSideShowing = true
            }
        })
    }
    
    func closeSideMenu() {
        let options = UIViewAnimationOptions([.beginFromCurrentState, .curveEaseInOut])
        
        UIView.animate(withDuration: TimeInterval(SLID_TIME), delay: TimeInterval(0), options: options, animations: {
            
            self.navigationVC?.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: {
            if $0 == true {
                self.sideVC?.view.removeFromSuperview()
                self.sideVC = nil
                self.isSideShowing = false
                self.shadowEffect(shadow: false, offset: 0)
            }
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

