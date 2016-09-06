//
//  ViewController.swift
//  asobiba
//
//  Created by 田中千洋 on 2015/12/15.
//  Copyright © 2015年 田中 颯. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


class eatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , UITextFieldDelegate{
    
    var myItems: [String] = []//"1","2","3","4","5"
    var nameItems: [String] = []//"ラーメン","焼き肉","サイゼリア","ラーメン２","ラーメン３"
    var yosanItems: [String] = []//"1000","1000","1000","1000","1000"
    var kyoriItems: [String] = []//"10","4","2","7","5"
    var starItems: [String] = []//"4.5","4.3","3.4","2.4","1.7"
    var categoryItems: [String] = []//"ラーメン","焼き肉","ファミレス","ラーメン","ラーメン"
    var comentnumberItems: [String] = []//"16","11","8","7","5"
    var numItem: [String] = []//"1","2","3","4","5"
    var imageView = UIView(frame: CGRectMake(0, 0, 300, 300))
    var DeleteButton:UIButton!
    var countItems: [String] = []
    var num:Int = 1
    var none:UIBarButtonItem!
    
   
    var myTableView: UITableView = UITableView()
    
    let colorBg1 = UIColor(red: 255/255, green: 114/255, blue: 47/255, alpha: 1.0)
    let colorBg2 = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)
    let colorBg3 = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1.0)
    let colorBg4 = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1.0)
    let colorBg5 = UIColor(red: 241/255, green: 159/255, blue: 77/255, alpha: 1.0)
    var searchButton:UIButton!
    var locationlabel:UILabel = UILabel(frame: CGRectMake(0,0,320,25))
    

    
        override func viewDidLoad() {
        super.viewDidLoad()
            
            self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
            
           

            
        self.navigationController?.navigationBar.barTintColor = colorBg1
        self.navigationItem.title = "ASOVIVA"
        
            
        // Viewの背景色をorengeに設定する.
       
        
        myTableView.backgroundColor = colorBg2
        self.view.backgroundColor = colorBg2
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        
        // Viewの高さと幅を取得.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        myTableView.frame = CGRect(x: 0, y: barHeight + 50, width: displayWidth, height: displayHeight - 70)
        myTableView.registerClass(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        // DataSourceの設定.
        myTableView.dataSource = self
        // Delegateを設定.
        myTableView.delegate = self
        // Viewに追加する.
        self.view.addSubview(myTableView)
            
            
        none = UIBarButtonItem(title: "", style: .Plain, target: self, action: "")
        self.navigationItem.leftBarButtonItem = none
        none.enabled = false
        
        
            // Do any additional setup after loading the view, typically from a nib.
            

        searchButton = UIButton(frame: CGRectMake(0,0,360,34))
        searchButton.backgroundColor = UIColor.whiteColor()
        searchButton.layer.masksToBounds = true
        searchButton.setTitle("詳しく検索", forState: .Normal)
        searchButton.setTitleColor(colorBg3, forState: UIControlState.Normal)
        searchButton.layer.cornerRadius = 10.0
        searchButton.layer.position = CGPoint(x: self.view.bounds.width / 2, y:85)
        searchButton.titleLabel?.font = UIFont.systemFontOfSize(20)
        searchButton.addTarget(self, action: "searchButton:", forControlEvents: .TouchUpInside)
        searchButton.layer.borderWidth = 1
        self.view.addSubview(searchButton)
            
        locationlabel.layer.position = CGPoint(x: self.view.bounds.width / 2, y: 115)
        locationlabel.backgroundColor = UIColor.whiteColor()
        locationlabel.layer.borderWidth = 1
        locationlabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(locationlabel)
            
            
        
            
            // myViewの背景を緑色に設定.
        imageView.backgroundColor = UIColor.orangeColor()
            // 透明度を設定.
        imageView.alpha = 0.8
            // 位置を中心に設定.
        imageView.layer.position = CGPointMake(self.view.frame.width/2, self.view.frame.height/2)
            // myViewを非表示.
        imageView.hidden = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        self.view.addSubview(imageView)
            
            
        DeleteButton = UIButton(frame: CGRectMake(0,0,50,50))
        DeleteButton.backgroundColor = UIColor.whiteColor()
        DeleteButton.layer.masksToBounds = true
        DeleteButton.setTitle("☓", forState: .Normal)
        DeleteButton.setTitleColor(colorBg3, forState: UIControlState.Normal)
        DeleteButton.layer.cornerRadius = 10.0
        DeleteButton.layer.position = CGPoint(x:275, y:25)
        DeleteButton.titleLabel?.font = UIFont.systemFontOfSize(20)
        DeleteButton.addTarget(self, action: "deleteView:", forControlEvents: .TouchUpInside)
        DeleteButton.layer.borderWidth = 1
        imageView.addSubview(DeleteButton)
            
        let image = UIImage(named: "meat.png")
            
        var bigImage:UIImageView = UIImageView(frame:(CGRectMake(0,0,240,240)))
        bigImage.layer.position = CGPoint(x:150 ,y:150)
        bigImage.image = image
        imageView.addSubview(bigImage)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let myfiveViewController: UIViewController = storeViewController()
        self.navigationController?.pushViewController(myfiveViewController, animated: true)

    }
    
    /*
    Cellの総数を返す.
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cell: CustomTableViewCell = tableView.dequeueReusableCellWithIdentifier("customCell", forIndexPath: indexPath) as! CustomTableViewCell
        
        cell.numberLabel.numberOfLines = 0
        cell.numberLabel.text = self.myItems[indexPath.row]
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.text = self.nameItems[indexPath.row]
        cell.starLabel.numberOfLines = 0
        cell.starLabel.text = self.starItems[indexPath.row]
        cell.yosanLabel.numberOfLines = 0
        cell.yosanLabel.text = "予算　" + self.yosanItems[indexPath.row] + "円"
        cell.kyoriLabel.numberOfLines = 0
        cell.kyoriLabel.text = "徒歩　" + self.kyoriItems[indexPath.row] + "分"
        cell.locationButton.addTarget(self, action: "mapButton:", forControlEvents: .TouchUpInside)
        cell.locationButton.backgroundColor = colorBg5
        let image1 = UIImage(named: "meat.png")
        let image2 = UIImage(named: "meat.png")
        let image3 = UIImage (named: "meat.png")
        cell.myImagebutton1.setImage(image1, forState: .Normal)
        cell.myImagebutton2.setImage(image2, forState: .Normal)
        cell.myImagebutton3.setImage(image3, forState: .Normal)
        cell.myImagebutton1.addTarget(self, action: "tap:", forControlEvents:.TouchUpInside)
        cell.myImagebutton2.addTarget(self, action: "tap:", forControlEvents:.TouchUpInside)
        cell.myImagebutton3.addTarget(self, action: "tap:", forControlEvents:.TouchUpInside)
        return cell
        
        
        
    }
    func searchButton(sender:UIButton) {
        let myfourthViewController: UIViewController = searchViewController()
        self.navigationController?.pushViewController(myfourthViewController, animated: true)
    }
    func mapButton(sender:UIButton){
        let mySecondViewController: UIViewController = mapViewController()
        // Viewの移動する.
        self.navigationController?.pushViewController(mySecondViewController, animated: true)
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let font = UIFont.systemFontOfSize(17)
        let bounds = CGSizeMake(self.view.frame.size.width - 16, CGFloat.max)
        let attributes = [NSFontAttributeName: font]
        let options = unsafeBitCast(NSStringDrawingOptions.UsesLineFragmentOrigin.rawValue |
        NSStringDrawingOptions.UsesFontLeading.rawValue, NSStringDrawingOptions.self)
        let rect:CGRect = myItems[indexPath.row].boundingRectWithSize(bounds, options: options, attributes: attributes, context: nil)
        let size:CGSize? = CGSize(width: rect.size.width, height: rect.size.height)
        
        let height = size?.height
        
        if height! > 300 {
            return 300
        } else {
            return 300
        }
        
    }
    func tap(sender:UIButton){
        print("hello")
        imageView.hidden = false
    }
    func deleteView(sender:UIButton) {
        print("delete")
        imageView.hidden = true
    }
    override func viewWillAppear(animated: Bool) {
        super.viewDidDisappear(animated)
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        num = appDelegate.viewVal
        print(num)
            self.nameItems = []
            self.yosanItems = []
            self.starItems = []
            self.categoryItems = []
            self.myItems = []
            self.kyoriItems = []
            self.comentnumberItems = []
            self.countItems = []
            
            Alamofire.request(.GET, "http://localhost:" + "\(num + 10000)")
                .responseJSON { response in
                    // ここに処理を記述していく
                    // print(response.result.value)
                    
                    let object = response.result.value
                    let json = JSON(object!)
                    
                    json.forEach { (_, json) in
                        self.countItems.append(String(json["name"]))
                    }
                    for i in 0 ..< self.countItems.count {
                        self.nameItems.append("ラーメン")
                        self.yosanItems.append("1000")
                        self.starItems.append("3.0")
                        self.categoryItems.append("麺類")
                        self.numItem.insert(String(i + 1), atIndex: i)
                        self.kyoriItems.append("9")
                        self.myItems.append(String(i + 1))
                        self.comentnumberItems.append("10")
                    }
                    json.forEach { (_, json) in
                        // 記事タイトルを表示
                        var index:Int = self.numItem.indexOf(String(json["number"]))!
                        self.nameItems.insert(String(json["name"]), atIndex: index )
                        self.nameItems.removeAtIndex(index + 1)
                        self.yosanItems.insert(String(json["price"]), atIndex: index )
                        self.yosanItems.removeAtIndex(index + 1)
                        self.starItems.insert(String(json["Evaluation"]), atIndex: index )
                        self.starItems.removeAtIndex(index + 1)
                        self.categoryItems.insert(String(json["category"]), atIndex: index )
                        self.categoryItems.removeAtIndex(index + 1)
                        self.myTableView.reloadData()
                    }//何個も入れる場合
                    
                    switch self.num {
                    case 1:
                        self.locationlabel.text = "東京の検索結果(" + String(self.nameItems.count) + "/" + String(self.nameItems.count) + "件)"
                    case 2:
                        self.locationlabel.text = "神奈川の" + "検索結果" + "(" + "2" + "/" + "2" + "件)"
                    case 3:
                        self.locationlabel.text = "埼玉の" + "検索結果" + "(" + "2" + "/" + "2" + "件)"
                    default:
                        self.locationlabel.text = "現在地の" + "検索結果" + "(" + "2" + "/" + "2" + "件)"
                    }
                    }
        
                    }
    
    }



    extension JSON {
        public var Str: String? {
            get {
                switch self.type {
                case .String:
                    return self.object as? String
                default:
                    return nil
                }
            }
        }
    }
