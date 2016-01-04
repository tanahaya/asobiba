//
//  settingViewController.swift
//  asobiba
//
//  Created by 田中千洋 on 2015/12/24.
//  Copyright © 2015年 田中 颯. All rights reserved.
//

import UIKit

class editViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var myTableView: UITableView = UITableView()
    var myItems: [String] = ["学年","口コミ数","学校","性別","好きな食べもの"]
    var statusItems: [String] = ["タナハヤ","中学３年","7","聖光学院","男","ラーメン"]
    var myImageView: UIImageView!
    var editButton:UIBarButtonItem!
    var myButton:UIButton!
    var myImage:UIImage!
    let defaults = NSUserDefaults.standardUserDefaults()
    var dic = ["first": true]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults.registerDefaults(dic)
        
        self.title = "タナハヤ" + "のプロフィールの編集"
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        
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
        
        
       
        
        if defaults.boolForKey("first") {
            myImage = UIImage(named: "person2.png")
            defaults.setObject(false, forKey: "fisrt")
        }else {
            myImage = defaults.objectForKey("image")  as! UIImage
            
        }
        
        
        
        myButton  = UIButton(frame: CGRectMake(0,0,180,180))
        myButton.setImage(myImage, forState: .Normal)
        myButton.layer.position = CGPoint(x: 100,y:  164)
        myButton.addTarget(self, action: "changeimage:", forControlEvents:.TouchUpInside)
        self.view.addSubview(myButton)
        
        
        
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
    func edit(sender:UIButton) {
        let myAlert: UIAlertController = UIAlertController(title: "変更完了", message: "OK", preferredStyle: UIAlertControllerStyle.Alert)
        
        // OKアクション生成.
        let OkAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
            print("OK")
        }
        myAlert.addAction(OkAction)
        
        
        // Alertを発動する.
        presentViewController(myAlert, animated: true, completion: nil)

    }
    func changeimage(sender:UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            // フォトライブラリの画像・写真選択画面を表示
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .PhotoLibrary
            imagePickerController.allowsEditing = true
            imagePickerController.delegate = self
            presentViewController(imagePickerController, animated: true, completion: nil)
        }
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        // 選択した画像・写真を取得し、imageViewに表示
        if let info = editingInfo, let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
            myButton.setImage(editedImage, forState: .Normal)
            defaults.setObject(editedImage, forKey: "image")
        }else{
            myButton.setImage(image, forState: .Normal)
        }
        
        // フォトライブラリの画像・写真選択画面を閉じる
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
