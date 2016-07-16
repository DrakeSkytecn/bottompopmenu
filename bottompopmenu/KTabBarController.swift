//
//  KTabBarController.swift
//  bottompopmenu
//
//  Created by Kratos on 7/10/16.
//  Copyright © 2016 Kratos. All rights reserved.
//

import UIKit

class KTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        switch tabBar.selectedItem!.tag {
        case 0:
            (viewControllers![0].childViewControllers[0] as! RootViewController).changeMenuState()
        case 1:
            print("1")
        default:
            break
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
