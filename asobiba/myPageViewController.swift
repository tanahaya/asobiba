//
//  myPageViewController.swift
//  asobiba
//
//  Created by 田中千洋 on 2016/01/03.
//  Copyright © 2016年 田中 颯. All rights reserved.
//

import UIKit

class myPageViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

   
    var myTableView: UITableView = UITableView()
    var myItems: [String] = ["学年","口コミ数","学校","性別","好きな食べもの"]
    var statusItems: [String] = ["タナハヤ","中学３年","7","聖光学院","男","ラーメン"]
    var myImageView: UIImageView!
    var settingButton:UIBarButtonItem!
    var myButton:UIButton!
    let myStatus = NSUserDefaults.standardUserDefaults()
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.title = "タナハヤ" + "のプロフィール"
            self.view.backgroundColor = UIColor.whiteColor()
            self.navigationController?.navigationBar.barTintColor = UIColor.orangeColor()
            
            settingButton = UIBarButtonItem(title: "編集する", style: .Plain, target: self, action: "movesetting:")
            self.navigationItem.rightBarButtonItem = settingButton
            

            
            let myLabel: UILabel = UILabel(frame: CGRectMake(0,0,150,50))
            
            // 背景をオレンジ色にする.
            myLabel.backgroundColor = UIColor.orangeColor()
            // 枠を丸くする.
            myLabel.layer.masksToBounds = true
            // コーナーの半径.
            myLabel.layer.cornerRadius = 20.0
            // Labelに文字を代入.
            myLabel.text = "\(statusItems[0])"
            // 文字の色を白にする.
            myLabel.textColor = UIColor.blackColor()
            // 文字の影の色をグレーにする.
            myLabel.shadowColor = UIColor.grayColor()
            // Textを中央寄せにする.
            myLabel.textAlignment = NSTextAlignment.Center
            // 配置する座標を設定する.
            myLabel.layer.position = CGPoint(x: 270,y: 164)
            // Viewの背景色を青にする.
            myTableView.separatorColor = UIColor.blackColor()
            // ViewにLabelを追加.
            self.view.addSubview(myLabel)
            myTableView.scrollEnabled = false
            
            
            myImageView = UIImageView(frame: CGRectMake(0,0,180,180))
            // 表示する画像を設定する.
            let myImage = UIImage(named: "person2.png")
            
            // 画像をUIImageViewに設定する.
            myImageView.image = myImage
            
            // 画像の表示する座標を指定する.
            myImageView.layer.position = CGPoint(x: 100, y: 164)
            
            // UIImageViewをViewに追加する.

            self.view.addSubview(myImageView)
            
            
            
            
            
            
            
            
            
            
            
            // Viewの高さと幅を取得.
            let displayWidth: CGFloat = self.view.frame.width
            let displayHeight: CGFloat = self.view.frame.height
            myTableView.frame = CGRect(x: 0, y: 270, width: displayWidth, height: displayHeight)
            myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
            myTableView.dataSource = self
            // Delegateを設定する.
            myTableView.delegate = self
            // Viewに追加する.
            self.view.addSubview(myTableView)
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            print("Num: \(indexPath.row)")
            print("Value: \(myItems[indexPath.row])")
        }
        
        /*
        Cellの総数を返す.
        */
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return myItems.count
        }
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            // 再利用するCellを取得する.
            let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
            
            // Cellに値を設定する.
            cell.textLabel!.text = "\(myItems[indexPath.row])" + "      :       " + "\(statusItems[indexPath.row + 1])"
            
            return cell
        }
    func movesetting(sender:UIButton){
        let myeightViewController: UIViewController = editViewController()
        
        // Viewの移動する.
        //self.presentViewController(myfourthViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(myeightViewController, animated: true)

    }
        
        
    }





