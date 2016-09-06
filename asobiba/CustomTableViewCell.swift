//
//  CustomTableViewCell.swift
//  asobiba
//
//  Created by 田中千洋 on 2015/12/23.
//  Copyright © 2015年 田中 颯. All rights reserved.
//

import UIKit


class CustomTableViewCell: UITableViewCell {
    
    var titleLabel = UILabel()
    var contentLabel = UILabel()
    var numberLabel = UILabel()
    var starLabel = UILabel()
    var hyoukaLabel = UILabel()
    var tenLabel = UILabel()
    var categoryLabel = UILabel()
    var comentnumberLabel = UILabel()
    var myImagebutton1: UIButton!
    var myImagebutton2: UIButton!
    var myImagebutton3: UIButton!
    var locationButton: UIButton!
    var yosanLabel = UILabel()
    var kyoriLabel = UILabel()
    

    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!){
        //First Call Super
        
        
        //cellの高さを変える
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        numberLabel = UILabel(frame: CGRectMake(20,15,300,35))
        numberLabel.text = ""
        numberLabel.font = UIFont(name: "HiraginoSans-W0", size: 45)
        numberLabel.font = UIFont.systemFontOfSize(45)
        self.addSubview(numberLabel)
        
        titleLabel = UILabel(frame: CGRectMake(55,15,300,35))
        titleLabel.text = ""
        titleLabel.font = UIFont(name: "HiraginoSans-W0", size: 35)
        titleLabel.font = UIFont.systemFontOfSize(35)
        self.addSubview(titleLabel)
        
        
        starLabel = UILabel(frame: CGRectMake(85,75,300,40))
        starLabel.text = ""
        starLabel.font = UIFont(name: "HiraginoSans-W0", size: 50)
        starLabel.font = UIFont.systemFontOfSize(50)
        self.addSubview(starLabel)
        
        hyoukaLabel = UILabel(frame: CGRectMake(20,60,300,40))
        hyoukaLabel.text = "評価"
        hyoukaLabel.font = UIFont(name: "HiraginoSans-W0", size: 25)
        hyoukaLabel.font = UIFont.systemFontOfSize(25)
        self.addSubview(hyoukaLabel)
        
        tenLabel = UILabel(frame: CGRectMake(170,90,300,40))
        tenLabel.text = "点"
        tenLabel.font = UIFont(name: "HiraginoSans-W0", size: 30)
        tenLabel.font = UIFont.systemFontOfSize(30)
        self.addSubview(tenLabel)
        
        yosanLabel = UILabel(frame: CGRectMake(15,130,300,50))
        yosanLabel.text = ""
        yosanLabel.font = UIFont(name: "HiraginoSans-W0", size: 30)
        yosanLabel.font = UIFont.systemFontOfSize(30)
        self.addSubview(yosanLabel)
        
        kyoriLabel = UILabel(frame: CGRectMake(220,150,300,50))
        kyoriLabel.text = ""
        kyoriLabel.font = UIFont(name: "HiraginoSans-W0", size: 30)
        kyoriLabel.font = UIFont.systemFontOfSize(30)
        self.addSubview(kyoriLabel)

        
        locationButton = UIButton(frame: CGRectMake(230,80,130,70))
         locationButton.setTitle("", forState: .Normal)
        locationButton.layer.cornerRadius = 20.0
        // locationButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        let walkimage = UIImage(named: "mappin.png")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        locationButton.setImage(walkimage, forState: .Normal)
        locationButton.tintColor = UIColor.whiteColor()
        self.addSubview(locationButton)
        
        let image = UIImage(named: "meat.png") 
        
        // UIImageViewを作成する.
        myImagebutton1 = UIButton(frame: CGRectMake(10,190,100,100))
        myImagebutton1.setImage(image, forState: .Normal)
        self.addSubview(myImagebutton1)
        
        
        
        // UIImageViewを作成する.
        myImagebutton2 = UIButton(frame: CGRectMake(130,190,100,100))
        myImagebutton2.setImage(image, forState: .Normal)
        self.addSubview(myImagebutton2)
        
        
        
        // UIImageViewを作成する.
        myImagebutton3 = UIButton(frame: CGRectMake(250,190,100,100))
        myImagebutton3.setImage(image, forState: .Normal)
        self.addSubview(myImagebutton3)
        

        
            }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    
//    required init(coder aDecoder: NSCoder)
//    {
//        super.init(coder: aDecoder)!
//    }
}