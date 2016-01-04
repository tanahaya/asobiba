//
//  settingViewController.swift
//  asobiba
//
//  Created by 田中千洋 on 2015/12/24.
//  Copyright © 2015年 田中 颯. All rights reserved.
//

import UIKit

class settingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let profileItems: NSArray = ["iOS8", "iOS7", "iOS6", "iOS5", "iOS4"]
    let reviewerItems: NSArray = ["5.x", "4.x", "2.x", "1.x"]
    var editButton:UIBarButtonItem!
    
    // Sectionで使用する配列を定義する.
    let mySections: NSArray = ["設定変更","レビュアーページ管理"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "タナハヤ" + "のプロフィール"
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        
        // Viewの高さと幅を取得する.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // TableViewの生成( status barの高さ分ずらして表示 ).
        let myTableView: UITableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        
        // Cell名の登録をおこなう.
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        // DataSourceの設定をする.
        myTableView.dataSource = self
        
        // Delegateを設定する.
        myTableView.delegate = self
        
        // Viewに追加する.
        self.view.addSubview(myTableView)
        
        editButton = UIBarButtonItem(title: "編集する", style: .Plain, target: self, action: "edit:")
        self.navigationItem.rightBarButtonItem = editButton
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return mySections.count
    }
    
    /*
    セクションのタイトルを返す.
    */
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySections[section] as? String
    }
    
    /*
    Cellが選択された際に呼び出される.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 0 {
            print("Value: \(profileItems[indexPath.row])")
        } else if indexPath.section == 1 {
            print("Value: \(reviewerItems[indexPath.row])")
        }
    }
    
    /*
    テーブルに表示する配列の総数を返す.
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return profileItems.count
        } else if section == 1 {
            return reviewerItems.count
        } else {
            return 0
        }
    }
    
    /*
    Cellに値を設定する.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "\(profileItems[indexPath.row])"
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "\(reviewerItems[indexPath.row])"
        }
        
        return cell
    }
    func edit(sender:UIButton) {
        
               
        let mytwoViewController: UIViewController = editViewController()
        // Viewの移動する.
        //self.presentViewController(myfourthViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(mytwoViewController, animated: true)
    }
    
    
    
}
