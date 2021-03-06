//
//  homeViewController.swift
//  asobiba
//
//  Created by 田中千洋 on 2016/03/28.
//  Copyright © 2016年 田中 颯. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {

    let colorBg1 = UIColor(red: 250/255, green: 124/255, blue: 146/255, alpha: 1.0)
    let colorBg2 = UIColor(red: 110/255, green: 196/255, blue: 219/255, alpha: 1.0)
    let colorBg3 = UIColor(red: 60/255, green: 196/255, blue: 124/255, alpha: 1.0)
    let colorBg4 = UIColor(red: 255/255, green: 247/255, blue: 140/255, alpha: 1.0)
    var myImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImageView = UIImageView(frame: CGRectMake(0,0,330,180))
        // 表示する画像を設定する.
        let myImage = UIImage(named: "storeMain.jpg")
        // 画像をUIImageViewに設定する.
        myImageView.image = myImage
        // 画像の表示する座標を指定する.
        myImageView.layer.position = CGPoint(x: self.view.bounds.width/2, y: 100.0)
        // UIImageViewをViewに追加する.
        self.view.addSubview(myImageView)
        
        
        self.view.backgroundColor = colorBg1
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
