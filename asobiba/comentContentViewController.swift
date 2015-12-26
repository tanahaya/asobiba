//
//  comentContentViewController.swift
//  asobiba
//
//  Created by 田中千洋 on 2015/12/25.
//  Copyright © 2015年 田中 颯. All rights reserved.
//

import UIKit

class comentContentViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
        self.title = "コメント1の内容"
        // 背景を灰色に設定する.
        self.view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        
        // TextView生成する.
        let myTextView: UITextView = UITextView(frame: CGRectMake(10, 100, self.view.frame.width - 20, 500))
        
        // TextViewの背景を黃色に設定する.
        myTextView.backgroundColor = UIColor.whiteColor()
        // 表示させるテキストを設定する.
        myTextView.text = "美味しかった\nまた行きたいな"
        // 角に丸みをつける.
        myTextView.layer.masksToBounds = true
        
        // 丸みのサイズを設定する.
        myTextView.layer.cornerRadius = 20.0
        
        // 枠線の太さを設定する.
        myTextView.layer.borderWidth = 1
        
        // 枠線の色を黒に設定する.
        myTextView.layer.borderColor = UIColor.blackColor().CGColor
        
        // フォントの設定をする.
        myTextView.font = UIFont.systemFontOfSize(CGFloat(20))
        
        // フォントの色の設定をする.
        myTextView.textColor = UIColor.blackColor()
        
        // 左詰めの設定をする.
        myTextView.textAlignment = NSTextAlignment.Left
        
        // リンク、日付などを自動的に検出してリンクに変換する.
        myTextView.dataDetectorTypes = UIDataDetectorTypes.All
        
        // 影の濃さを設定する.
        myTextView.layer.shadowOpacity = 0.5
        
        // テキストを編集不可にする.
        myTextView.editable = false
        
        // TextViewをViewに追加する.
        self.view.addSubview(myTextView)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
