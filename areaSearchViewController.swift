//
//  areaSearchViewController.swift
//  asobiba
//
//  Created by 田中千洋 on 2016/01/17.
//  Copyright © 2016年 田中 颯. All rights reserved.
//

import UIKit

class areaSearchViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource  {

    var searchTextField: UITextField!
    
    let myItems: NSArray = ["東京", "神奈川", "埼玉"]
    var myTableView: UITableView!
    var searchButton:UIBarButtonItem!
    var num:Int = 0

    let search = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "エリア・駅で検索"
        self.view.backgroundColor = UIColor.whiteColor()

        self.navigationItem.title = "条件入力"
        searchButton = UIBarButtonItem(title: "検索", style: .Plain, target: self, action: "search:")
        self.navigationItem.rightBarButtonItem = searchButton
        
        searchTextField = UITextField(frame: CGRectMake(0,0,300,30))
        // 表示する文字を代入する.
        searchTextField.text = ""
        // Delegateを設定する.
        searchTextField.delegate = self
        // 枠を表示する.
        searchTextField.borderStyle = UITextBorderStyle.RoundedRect
        // UITextFieldの表示する位置を設定する.
        searchTextField.layer.position = CGPoint(x:self.view.bounds.width/2,y:100);
        // Viewに追加する.
        self.view.addSubview(searchTextField)
        
        
        // Viewの高さと幅を取得する.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        // TableViewの生成する(status barの高さ分ずらして表示).
        myTableView = UITableView(frame: CGRect(x: 0, y: 140, width: displayWidth, height: displayHeight - 140))
        // Cell名の登録をおこなう.
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        // DataSourceの設定をする.
        myTableView.dataSource = self
        // Delegateを設定する.
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
       
        num = indexPath.row + 1
        
        let myfiveViewController: UIViewController = searchViewController()
        // Viewの移動する.
        self.navigationController?.pushViewController(myfiveViewController, animated: true)
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
        
        searchTextField.text = myItems[indexPath.row] as! String
        
        return cell
    }
    func search(sender:UIBarButtonItem){
        print("検索")
        
        search.setObject(searchTextField.text, forKey: "area")

        let myfiveViewController: UIViewController = searchViewController()
        // Viewの移動する.
        self.navigationController?.pushViewController(myfiveViewController, animated: true)

    }
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.viewVal = num
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
