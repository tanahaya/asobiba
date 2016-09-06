//
//  comentContentViewController.swift
//  asobiba
//
//  Created by 田中千洋 on 2015/12/25.
//  Copyright © 2015年 田中 颯. All rights reserved.
//

import UIKit

class comentContentViewController: UIViewController {
    
    
    let titleLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,20))
    let writerButton: UIButton = UIButton(frame: CGRectMake(0,0,200,20))
    let starLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,20))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
        self.title = "コメント1の内容"
        // 背景を灰色に設定する.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let myImageView = UIImageView(frame: CGRectMake(0,0,70,70))
        // 表示する画像を設定する.
        let myImage = UIImage(named: "person2.png")
        // 画像をUIImageViewに設定する.
        myImageView.image = myImage
        // 画像の表示する座標を指定する.
        myImageView.layer.position = CGPoint(x: 40, y: 120)
        // UIImageViewをViewに追加する.
        self.view.addSubview(myImageView)
        
        // titleLabel.backgroundColor = UIColor.orangeColor()
        // 枠を丸くする.
        titleLabel.layer.masksToBounds = true
        // コーナーの半径.
        titleLabel.layer.cornerRadius = 5.0
        // Labelに文字を代入.
        titleLabel.text = "タイトル:" + "サイコー"
        // 文字の色を白にする.
        titleLabel.textColor = UIColor.blackColor()
        // 文字の影の色をグレーにする.
        titleLabel.shadowColor = UIColor.grayColor()
        // Textを中央寄せにする.
        titleLabel.textAlignment = NSTextAlignment.Center
        // 配置する座標を設定する.
        titleLabel.layer.position = CGPoint(x: 200,y: 80)
        // Viewの背景色を青にする.
        // ViewにLabelを追加.
        titleLabel.layer.borderWidth = 1
        self.view.addSubview(titleLabel)
        
        // writerLabel.backgroundColor = UIColor.orangeColor()
        // 枠を丸くする.
        writerButton.layer.masksToBounds = true
        // コーナーの半径.
        writerButton.layer.cornerRadius = 5.0
        // Labelに文字を代入.
        writerButton.setTitle("投稿者" + "まこら", forState: .Normal)
        // 文字の色を白にする.
        writerButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        writerButton.addTarget(self, action: "movewriter:", forControlEvents: .TouchUpInside)
        // 配置する座標を設定する.
        writerButton.layer.position = CGPoint(x: 200,y: 110)
        // Viewの背景色を青にする.
        writerButton.layer.borderWidth = 1
        // ViewにLabelを追加.
        self.view.addSubview(writerButton)
        

        // starLabel.backgroundColor = UIColor.orangeColor()
        // 枠を丸くする.
        starLabel.layer.masksToBounds = true
        // コーナーの半径.
        starLabel.layer.cornerRadius = 5.0
        // Labelに文字を代入.
        starLabel.text = "味:" + "7" + "  " + "CP:" + "8" + "  " + "総合:" + "9" + "  "
        // 文字の色を白にする.
        starLabel.textColor = UIColor.blackColor()
        // 文字の影の色をグレーにする.
        starLabel.shadowColor = UIColor.grayColor()
        // Textを中央寄せにする.
        starLabel.textAlignment = NSTextAlignment.Center
        // 配置する座標を設定する.
        starLabel.layer.position = CGPoint(x: 200,y: 140)
        // Viewの背景色を青にする.
        starLabel.layer.borderWidth = 1
        // ViewにLabelを追加.
        self.view.addSubview(starLabel)

        
        
        
        // TextView生成する.
        let myTextView: UITextView = UITextView(frame: CGRectMake(5, 160, self.view.frame.width - 10, 400))
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
    func movewriter(sender:UIButton) {
        let sixViewController: UIViewController = writerViewController()
        
        self.navigationController?.pushViewController(sixViewController, animated: true)
    }

}
