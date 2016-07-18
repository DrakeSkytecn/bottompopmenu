//
//  DialViewController.swift
//  bottompopmenu
//
//  Created by Kratos on 7/16/16.
//  Copyright © 2016 Kratos. All rights reserved.
//

import UIKit

/// 拨号盘控制器
class DialViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var dialPlateFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var dialPlate: UICollectionView!
    @IBOutlet weak var dialNumber: UILabel!
    @IBOutlet weak var dialNumberCon: UIView!
    
    let characters = ["ABC", "DEF", "GHI", "JKL", "MNO", "PQRS", "TUV", "WXYZ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dialPlateFlowLayout.itemSize.width = (Screen.width - 4) / 3
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0...8, 10:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(R.reuseIdentifier.dial_a.identifier, forIndexPath: indexPath) as! DialNumberCell
            
            if indexPath.row == 0 {
                cell.number.text = "\(indexPath.row + 1)"
            } else if indexPath.row == 10 {
                cell.number.text = "0"
            }else{
                cell.number.text = "\(indexPath.row + 1)"
                cell.character.text = characters[indexPath.row - 1]
            }
            return cell
            
        case 9, 11:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(R.reuseIdentifier.dial_b.identifier, forIndexPath: indexPath) as! DialIconCell
            if indexPath.row == 9 {
                cell.icon.image = R.image.paste()
                cell.hint.text = "粘贴"
            }else{
                cell.icon.image = R.image.delete()
                cell.hint.text = "删除"
            }
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0...8, 10:
            var temp = dialNumber.text
            if temp?.characters.count < 12 {
                dialNumberCon.hidden = false
            let number = (collectionView.cellForItemAtIndexPath(indexPath) as! DialNumberCell).number.text
            temp = temp! + number!
                dialNumber.text = temp
            }
        case 9:
            let paste = UIPasteboard.generalPasteboard()
            let pattern = "\\d{5,12}"
            let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
            if predicate.evaluateWithObject(paste.string) {
                dialNumber.text = paste.string
                dialNumberCon.hidden = false
            } else {
                
            }
        case 11:
            var temp = dialNumber.text
            let length = temp?.characters.count
            if length > 0 {
                temp = temp?.substringToIndex(temp!.startIndex.advancedBy(length! - 1))
                dialNumber.text = temp
                if length == 1 {
                    dialNumberCon.hidden = true
                }
            }
        default:
            break
        }
    }
    
    @IBAction func call(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://" + dialNumber.text!)!)
    }
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.cellForItemAtIndexPath(indexPath)?.backgroundColor = UIColor.groupTableViewBackgroundColor()
    }
    
    func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.cellForItemAtIndexPath(indexPath)?.backgroundColor = UIColor.whiteColor()
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
