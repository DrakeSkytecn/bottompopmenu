//
//  ViewController.swift
//  bottompopmenu
//
//  Created by Kratos on 7/9/16.
//  Copyright © 2016 Kratos. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    private var isMenuShow: Bool = false
    private var isViewHidden: Bool = true
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var aContainer: UIView!
    @IBOutlet weak var bContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }

    override func viewDidAppear(animated: Bool) {
        print("viewDidAppear")
        if !isMenuShow {
            print("isMenuShow")
            resetMenuY(-menuView.frame.height)
        }
        isViewHidden = false
    }
    
    override func viewDidDisappear(animated: Bool) {
        isViewHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeMenuState() {
        print("changeMenuState")
        if !isViewHidden {
            if isMenuShow {
                hide()
            } else {
                show()
            }
        }
    }
    
    private func show() {
        menuTranYAnimation(-menuView.frame.height)
        isMenuShow = true
    }
    
    private func hide() {
        menuTranYAnimation(menuView.frame.height)
        isMenuShow = false
    }
    
    private func resetMenuY(height: CGFloat) {
        var rect = self.menuView.frame
        rect.origin.y = rect.origin.y + height
        self.menuView.frame = rect
        isMenuShow = true
    }
    
    private func menuTranYAnimation(height: CGFloat) {
        UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {
            self.resetMenuY(height)
            }, completion: nil)
    }

    @IBAction func topMenuNav(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            aContainer.hidden = false
            bContainer.hidden = true
            break
        case 1:
            aContainer.hidden = true
            bContainer.hidden = false
            break
        default:
            break
        }
    }
}

