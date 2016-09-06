//
//  searchViewController.swift
//  asobiba
//
//  Created by 田中千洋 on 2015/12/23.
//  Copyright © 2015年 田中 颯. All rights reserved.
//

import UIKit

class searchViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var searchButton: UIBarButtonItem!
    var locationButton: UIButton!
    var keywordButton: UIButton!
    var longButton:UIButton!
    var pickOption = ["設定しない","1000 ~ 2000円", "2000 ~ 3000円", "3000 ~ 4000円", "4000 ~ 5000円", "5000円 ~ "]
    var pickerTextField: UITextField!
    var toolBar:UIToolbar!
    
    var locationlabel:UILabel = UILabel(frame: CGRectMake(0,0,200,30))
    var keywordlabel:UILabel = UILabel(frame: CGRectMake(0,0,200,30))
    var pricelabel:UILabel = UILabel(frame: CGRectMake(0,0,200,30))
    var nowopenlabel:UILabel = UILabel(frame: CGRectMake(0,0,200,30))
        
    let search = NSUserDefaults.standardUserDefaults()
    var num:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nowopenlabel.text = "現在開店中"
        locationlabel.text = "場所"
        keywordlabel.text = "キーワード"
        pricelabel.text = "値段"
        locationlabel.layer.position = CGPoint(x: self.view.bounds.width/3,y: 120)
        keywordlabel.layer.position = CGPoint(x: self.view.bounds.width/3,y: 170)
        pricelabel.layer.position = CGPoint(x: self.view.bounds.width/3,y: 220)
        nowopenlabel.layer.position = CGPoint(x: self.view.bounds.width/3, y: 270)
        self.view.addSubview(locationlabel)
        self.view.addSubview(keywordlabel)
        self.view.addSubview(pricelabel)
        self.view.addSubview(nowopenlabel)
        
        let openSwicth: UISwitch = UISwitch()
        openSwicth.layer.position = CGPoint(x: self.view.frame.width*2/3, y: 270)
        openSwicth.tintColor = UIColor.blackColor()
        openSwicth.on = true
        openSwicth.addTarget(self, action: "onClickMySwicth:", forControlEvents: UIControlEvents.ValueChanged)
        // SwitchをViewに追加する.
        self.view.addSubview(openSwicth)
        
        
        var pickerView = UIPickerView()
        pickerView.delegate = self
        pickerTextField = UITextField(frame: CGRectMake(0,0,200,30))
        // 表示する文字を代入する.
        // 枠を表示する.
        pickerTextField.borderStyle = UITextBorderStyle.RoundedRect
        pickerTextField.layer.borderWidth = 1
        // UITextFieldの表示する位置を設定する.
        pickerTextField.layer.position = CGPoint(x:self.view.bounds.width * 2 / 3,y:220);
        pickerTextField.inputView = pickerView
        pickerTextField.layer.cornerRadius = 5.0
        // Viewに追加する.
        self.view.addSubview(pickerTextField)
        
        
        self.navigationItem.title = "条件入力"
        searchButton = UIBarButtonItem(title: "検索", style: .Plain, target: self, action: "search:")
        self.navigationItem.rightBarButtonItem = searchButton
        
        
        searchButton = UIBarButtonItem(title: "キャンセル", style: .Plain, target: self, action: "back:")
        self.navigationItem.leftBarButtonItem = searchButton
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        locationButton = UIButton()
        locationButton.frame = CGRectMake(0,0,200,30)
        // 背景色を設定する.
        locationButton.backgroundColor = UIColor.whiteColor()
        // 枠を丸くする.
        locationButton.layer.masksToBounds = true
        // タイトルを設定する(通常時).
        
        locationButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        // コーナーの半径を設定する.
        locationButton.layer.cornerRadius = 5.0
        // ボタンの位置を指定する.
        locationButton.layer.position = CGPoint(x: self.view.frame.width * 2 / 3, y:120)
        // イベントを追加する.
        locationButton.addTarget(self, action: "movelocation:", forControlEvents: .TouchUpInside)
        locationButton.layer.borderWidth = 1
        locationButton.setTitle("東京、銀座", forState: UIControlState.Normal)
        
        // ボタンをViewに追加する.
        self.view.addSubview(locationButton)
        
        
        
        
        keywordButton = UIButton()
        keywordButton.frame = CGRectMake(0,0,200,30)
        // 背景色を設定する.
        keywordButton.backgroundColor = UIColor.whiteColor()
        // 枠を丸くする.
        keywordButton.layer.masksToBounds = true
        // タイトルを設定する(通常時).
        keywordButton.setTitle("ラーメン、焼き肉", forState: UIControlState.Normal)
        keywordButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        // コーナーの半径を設定する.
        keywordButton.layer.cornerRadius = 5.0
        // ボタンの位置を指定する.
        keywordButton.layer.position = CGPoint(x: self.view.frame.width * 2 / 3, y:170)
        // イベントを追加する.
        keywordButton.layer.borderWidth = 1
        keywordButton.addTarget(self, action: "movekeyword:", forControlEvents: .TouchUpInside)
        // ボタンをViewに追加する.
        self.view.addSubview(keywordButton)

        longButton = UIButton()
        longButton.frame = CGRectMake(0,0,200,40)
        // 背景色を設定する.
        longButton.backgroundColor = UIColor.whiteColor()
        // 枠を丸くする.
        longButton.layer.masksToBounds = true
        // タイトルを設定する(通常時).
        longButton.setTitle("距離", forState: UIControlState.Normal)
        longButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        // コーナーの半径を設定する.
        longButton.layer.cornerRadius = 20.0
        // ボタンの位置を指定する.
        longButton.layer.position = CGPoint(x: self.view.frame.width/2, y:220)
        // イベントを追加する.
        longButton.addTarget(self, action: "movelocation:", forControlEvents: .TouchUpInside)
        longButton.layer.borderWidth = 1
        // ボタンをViewに追加する.
        // self.view.addSubview(longButton)
        
        toolBar = UIToolbar(frame: CGRectMake(0, self.view.frame.size.height/6, self.view.frame.size.width, 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = .BlackTranslucent
        toolBar.tintColor = UIColor.whiteColor()
        toolBar.backgroundColor = UIColor.whiteColor()
        
        let toolBarBtn      = UIBarButtonItem(title: "完了", style: .Bordered, target: self, action: "tappedToolBarBtn:")
        toolBar.items = [toolBarBtn]
        pickerTextField.inputAccessoryView = toolBar
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func search(sender:UIButton){
//        print("hello")
//        let myAlert: UIAlertController = UIAlertController(title: "検索完了出来ました", message: "OK", preferredStyle: UIAlertControllerStyle.Alert)
//        
//        // OKアクション生成.
//        let OkAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
//            print("OK")
//        }
//        myAlert.addAction(OkAction)
//        
//        
//        // Alertを発動する.
//        presentViewController(myAlert, animated: true, completion: nil)
//        
        let myfiveViewController: UIViewController = eatViewController()
        // Viewの移動する.
        self.navigationController?.pushViewController(myfiveViewController, animated: true)
        

        
        
    }
    func movelocation(sender:UIButton){
       
        
        print("movelocation")
        let twoViewController: UIViewController = areaSearchViewController()
        self.navigationController?.pushViewController(twoViewController, animated: true)
        
    }
    func movekeyword(sender:UIButton){
        print("movekeyword")
        let threeViewController: UIViewController = keywordSearchViewController()
        self.navigationController?.pushViewController(threeViewController, animated: true)
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = pickOption[row]
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[row]
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption.count
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func tappedToolBarBtn(sender: UIBarButtonItem) {
        pickerTextField.resignFirstResponder()
    }
    func onClickMySwicth(sender: UISwitch){
        
        if sender.on {
           print("on")
        }
        else {
            print("off")
        }
    }
    func back(sender:UIBarButtonItem){
        let myViewController: UIViewController = eatViewController()
        // Viewの移動する.
        self.navigationController?.pushViewController(myViewController, animated: true)
    }
    
    
    
    
    
    
}
