//
//  FrontViewController.swift
//  SideMenu
//
//  Created by 김진형 on 2018. 7. 13..
//  Copyright © 2018년 김진형. All rights reserved.
//

import UIKit

class FrontViewController: UIViewController {

    var delegate: contentViewController?
    
    @objc func moveSide(_ sender: Any?) {
        if sender is UIScreenEdgePanGestureRecognizer {
            delegate?.openSideMenu()
        } else if sender is UISwipeGestureRecognizer {
            delegate?.closeSideMenu()
        } else if sender is UIBarButtonItem {
            if delegate?.isSideShowing == false {
                delegate?.openSideMenu()
            } else {
                delegate?.closeSideMenu()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        let sideBtn = UIBarButtonItem(image: UIImage(named: "menu-icon"), style: .plain, target: self, action: #selector(moveSide(_:)))
        
        self.navigationItem.leftBarButtonItem = sideBtn
        
        
        let dragLeft = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(moveSide(_:)))
        dragLeft.edges = .left
        view.addGestureRecognizer(dragLeft)
        
        let dragRight = UISwipeGestureRecognizer(target: self, action: #selector(moveSide(_:)))
        dragRight.direction = .left
        view.addGestureRecognizer(dragRight)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
