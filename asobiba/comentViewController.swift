//
//  comentViewController.swift
//  asobiba
//
//  Created by 田中千洋 on 2015/12/15.
//  Copyright © 2015年 田中 颯. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


class comentViewController: UIViewController ,UITextFieldDelegate{
    
    let tasteLabel: UILabel = UILabel(frame: CGRectMake(0,0,90,50))
    let tastenumber: UILabel = UILabel(frame: CGRectMake(0,0,50,50))
    let priceLabel: UILabel = UILabel(frame: CGRectMake(0,0,90,50))
    let pricenumber: UILabel = UILabel(frame: CGRectMake(0,0,50,50))
    let allLabel: UILabel = UILabel(frame: CGRectMake(0,0,90,50))
    let allnumber: UILabel = UILabel(frame: CGRectMake(0,0,50,50))
    
    let tasteSlider = UISlider(frame: CGRectMake(0, 0, 150, 30))
    let priceSlider = UISlider(frame: CGRectMake(0, 0, 150, 30))
    let allSlider = UISlider(frame: CGRectMake(0, 0, 150, 30))
    let label:UILabel = UILabel(frame: CGRectMake(0,0,200,30))
    
    var titleText:UITextField!
    let myTextView: UITextView = UITextView(frame: CGRectMake(0, 0,300, 210))
    
    var level:String!
    
    var postButton:UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "投稿"
        
        
        
        
        
        // Labelを作成.
        
//        tasteLabel.backgroundColor = UIColor.orangeColor()
//        tasteLabel.layer.masksToBounds = true
//        tasteLabel.layer.cornerRadius = 20.0
//        tasteLabel.text = "味"
//        tasteLabel.textColor = UIColor.whiteColor()
//        tasteLabel.shadowColor = UIColor.grayColor()
//        tasteLabel.textAlignment = NSTextAlignment.Center
//        tasteLabel.layer.position = CGPoint(x: self.view.bounds.width/5,y: 110)
//        self.view.addSubview(tasteLabel)
//        
//        
//        tastenumber.backgroundColor = UIColor.orangeColor()
//        tastenumber.layer.masksToBounds = true
//        tastenumber.layer.cornerRadius = 20.0
//        tastenumber.text = "5"
//        tastenumber.textColor = UIColor.whiteColor()
//        tastenumber.shadowColor = UIColor.grayColor()
//        tastenumber.textAlignment = NSTextAlignment.Center
//        tastenumber.layer.position = CGPoint(x: self.view.bounds.width*2/5,y: 110)
//        self.view.addSubview(tastenumber)
//        
//        
//        
//        
//        priceLabel.backgroundColor = UIColor.orangeColor()
//        priceLabel.layer.masksToBounds = true
//        priceLabel.layer.cornerRadius = 20.0
//        priceLabel.text = "CP"
//        priceLabel.textColor = UIColor.whiteColor()
//        priceLabel.shadowColor = UIColor.grayColor()
//        priceLabel.textAlignment = NSTextAlignment.Center
//        priceLabel.layer.position = CGPoint(x: self.view.bounds.width/5,y: 170)
//        self.view.addSubview(priceLabel)
//        
//        pricenumber.backgroundColor = UIColor.orangeColor()
//        pricenumber.layer.masksToBounds = true
//        pricenumber.layer.cornerRadius = 20.0
//        pricenumber.text = "5"
//        pricenumber.textColor = UIColor.whiteColor()
//        pricenumber.shadowColor = UIColor.grayColor()
//        pricenumber.textAlignment = NSTextAlignment.Center
//        pricenumber.layer.position = CGPoint(x: self.view.bounds.width*2/5,y: 170)
//        self.view.addSubview(pricenumber)
        
        
        allLabel.backgroundColor = UIColor.orangeColor()
        allLabel.layer.masksToBounds = true
        allLabel.layer.cornerRadius = 20.0
        allLabel.text = "総合"
        allLabel.textColor = UIColor.whiteColor()
        allLabel.shadowColor = UIColor.grayColor()
        allLabel.textAlignment = NSTextAlignment.Center
        allLabel.layer.position = CGPoint(x: self.view.bounds.width/5,y: 170)
        self.view.addSubview(allLabel)
        
        
        allnumber.backgroundColor = UIColor.orangeColor()
        allnumber.layer.masksToBounds = true
        allnumber.layer.cornerRadius = 20.0
        allnumber.text = "3.0"
        allnumber.textColor = UIColor.whiteColor()
        allnumber.shadowColor = UIColor.grayColor()
        allnumber.textAlignment = NSTextAlignment.Center
        allnumber.layer.position = CGPoint(x: self.view.bounds.width*2/5,y: 170)
        self.view.addSubview(allnumber)
//        
//        tasteSlider.layer.position = CGPointMake(self.view.bounds.width*7/10, 110)
//        tasteSlider.backgroundColor = UIColor.whiteColor()
//        tasteSlider.layer.cornerRadius = 10.0
//        tasteSlider.layer.masksToBounds = false
//        tasteSlider.minimumValue = 0
//        tasteSlider.maximumValue = 10// Sliderの位置を設定する.
//        tasteSlider.value = 5// Sliderの現在位置より右のTintカラーを変える.
//        tasteSlider.maximumTrackTintColor = UIColor.blackColor()// Sliderの現在位置より左のTintカラーを変える.
//        tasteSlider.minimumTrackTintColor = UIColor.orangeColor()
//        tasteSlider.addTarget(self, action: "onChangeValueMySlider:", forControlEvents: UIControlEvents.ValueChanged)
//        tasteSlider.tag = 1
//        self.view.addSubview(tasteSlider)
//        
//        priceSlider.layer.position = CGPointMake(self.view.bounds.width*7/10, 170)
//        priceSlider.backgroundColor = UIColor.whiteColor()
//        priceSlider.layer.cornerRadius = 10.0
//        priceSlider.layer.masksToBounds = false
//        priceSlider.minimumValue = 0
//        priceSlider.maximumValue = 10// Sliderの位置を設定する.
//        priceSlider.value = 5// Sliderの現在位置より右のTintカラーを変える.
//        priceSlider.maximumTrackTintColor = UIColor.blackColor()// Sliderの現在位置より左のTintカラーを変える.
//        priceSlider.minimumTrackTintColor = UIColor.orangeColor()
//        priceSlider.addTarget(self, action: "onChangeValueMySlider:", forControlEvents: UIControlEvents.ValueChanged)
//        priceSlider.tag = 2
//        self.view.addSubview(priceSlider)
        
        allSlider.layer.position = CGPointMake(self.view.bounds.width*7/10, 170)
        allSlider.backgroundColor = UIColor.whiteColor()
        allSlider.layer.cornerRadius = 10.0
        allSlider.layer.masksToBounds = false
        allSlider.minimumValue = 1.0
        allSlider.maximumValue = 5.0// Sliderの位置を設定する.
        allSlider.value = 3.0// Sliderの現在位置より右のTintカラーを変える.
        allSlider.maximumTrackTintColor = UIColor.blackColor()// Sliderの現在位置より左のTintカラーを変える.
        allSlider.minimumTrackTintColor = UIColor.orangeColor()
        allSlider.addTarget(self, action: "onChangeValueMySlider:", forControlEvents: UIControlEvents.ValueChanged)
        allSlider.tag = 3
        allSlider.setValue(3.0, animated: true)
        allSlider.layer.shadowOpacity = 0.1
        self.view.addSubview(allSlider)
        
        
        titleText = UITextField(frame: CGRectMake(0,0,300,30))
        // 表示する文字を代入する.
        titleText.placeholder = "タイトルを入力してね"
        // Delegateを設定する.
        titleText.delegate = self
        // 枠を表示する
        titleText.borderStyle = UITextBorderStyle.RoundedRect
        
        // UITextFieldの表示する位置を設定する.
        titleText.layer.position = CGPoint(x:self.view.bounds.width/2,y:280);
        titleText.layer.borderWidth = 3
        // Viewに追加する.
        self.view.addSubview(titleText)
        
        
        // 表示させるテキストを設定する.
        
        myTextView.layer.position = CGPoint(x:self.view.bounds.width/2,y:450)
        // 角に丸みをつける.
        myTextView.layer.masksToBounds = true
        // 丸みのサイズを設定する.
        myTextView.layer.cornerRadius = 10.0
        // 枠線の太さを設定する.
        myTextView.layer.borderWidth = 2
        // 枠線の色を黒に設定する.
        myTextView.layer.borderColor = UIColor.blackColor().CGColor
        // フォントの設定をする.
        myTextView.font = UIFont.systemFontOfSize(CGFloat(10))
        // フォントの色の設定をする.
        myTextView.textColor = UIColor.blackColor()
        // 左詰めの設定をする.
        myTextView.textAlignment = NSTextAlignment.Left
        // 影の濃さを設定する.
        myTextView.layer.shadowOpacity = 0.5
        // テキストを編集不可にする.
        myTextView.editable = true
        // TextViewをViewに追加する.
        self.view.addSubview(myTextView)
        
        label.layer.masksToBounds = true
        // コーナーの半径.
        label.layer.cornerRadius = 10.0
        label.backgroundColor = UIColor.whiteColor()
        label.text = "ここに本文を書いてね"
        label.layer.borderWidth = 2
        label.textColor = UIColor.blackColor()
        label.layer.masksToBounds = true
        label.textAlignment = NSTextAlignment.Center
        label.layer.position = CGPoint(x: self.view.bounds.width/2,y: 330)
        self.view.addSubview(label)
        
        postButton = UIBarButtonItem(title: "投稿", style: .Plain, target: self, action: "post:")
        self.navigationItem.rightBarButtonItem = postButton
        
        
        
        
    }
    func dicide(sender:UIButton) {
        
    }
    func onChangeValueMySlider(sender : UISlider){
        if sender.tag == 1 {
            level = String(Int(self.tasteSlider.value ))
            self.tastenumber.text = level
        }else if sender.tag == 2 {
            level = String(Float(self.priceSlider.value))
            self.pricenumber.text = level
        }else if sender.tag == 3 {
            level = String( Float(Int(Float(self.allSlider.value * 10)))/10)
            self.allnumber.text = level
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldDidBeginEditing(textField: UITextField){
        print("textFieldDidBeginEditing")
    }
    
    /*
    UITextFieldが編集終了する直前に呼ばれるデリゲートメソッド.
    */
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing")
        
        return true
    }
    
    /*
    改行ボタンが押された際に呼ばれるデリゲートメソッド.
    */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func post(sender:UIButton){
        let params =
            ["id": 1,
             "users": "hayate",
             "content": "oisaii"]
        Alamofire.request(.POST, "http://localhost:10001/", parameters: params, encoding: .JSON)
                   print("post")
        
        
    }
    
        
    }
    
    

