//
//  favoriteViewController.swift
//  asobiba
//
//  Created by 田中千洋 on 2016/03/06.
//  Copyright © 2016年 田中 颯. All rights reserved.
//

import UIKit

class favoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let myItems: NSArray = ["TEST1", "TEST2", "TEST3"]
    
    var myTableView: UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "タナハヤ" + "のお気に入りの店"

        let colorBg1 = UIColor(red: 255/255, green: 114/255, blue: 47/255, alpha: 1.0)
        let colorBg2 = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)

        self.navigationController?.navigationBar.barTintColor = colorBg1


        myTableView.backgroundColor = colorBg2
        self.view.backgroundColor = colorBg2
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        
        // Viewの高さと幅を取得.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        myTableView.frame = CGRect(x: 0, y: 5, width: displayWidth, height: displayHeight - 90)
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")

        // DataSourceの設定.
        myTableView.dataSource = self
        // Delegateを設定.
        myTableView.delegate = self
        // Viewに追加する.
        self.view.addSubview(myTableView)

        
        
        // Do any additional setup after loading the view.
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
    Cellの総数を返すデータソースメソッド.
    (実装必須)
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
    }
    
    /*
    Cellに値を設定するデータソースメソッド.
    (実装必須)
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        
        // Cellに値を設定する.
        cell.textLabel!.text = "\(myItems[indexPath.row])"
        
        return cell
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
