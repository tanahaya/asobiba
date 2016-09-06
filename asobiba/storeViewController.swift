
//
//  storeViewController.swift
//  asobiba
//
//  Created by 田中千洋 on 2016/03/28.
//  Copyright © 2016年 田中 颯. All rights reserved.
//

import UIKit

class storeViewController: UIViewController {

    var pageMenu : CAPSPageMenu?
    
   
    let colorBg1 = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
    let colorBg2 = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)
    var movecoment:UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "の詳細"
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        var controllerArray : [UIViewController] = []
        
        let controller1 = homeViewController()
        controller1.title = "Home"
        let controller2 = imageViewController()
        controller2.title = "写真"
        let controller3 = watchcomentViewController()
        controller3.title = "コメント"
        let controller4 = watchMapViewController()
        controller4.title = "地図"
        
        
        controllerArray.append(controller1)
        controllerArray.append(controller2)
        controllerArray.append(controller3)
        controllerArray.append(controller4)
//        
        self.view.backgroundColor = colorBg2
        
        var parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0)),
            .ViewBackgroundColor(UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0)),
            .SelectionIndicatorColor(UIColor.orangeColor()),
            .BottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
            .MenuItemFont(UIFont(name: "HelveticaNeue", size: 25.0)!),
            .MenuHeight(54.0),
            .MenuItemWidth(100.0),
            .CenterMenuItems(true)
        ]
        
        
        
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 60.0, self.view.frame.width, self.view.frame.height - 70), pageMenuOptions: parameters)
        
        movecoment = UIBarButtonItem(title: "コメントする", style: .Plain, target: self, action: "movecoment:")
        self.navigationItem.rightBarButtonItem = movecoment
       
        
        
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        
       // pageMenu!.didMoveToParentViewController(self)
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func movecoment(sender:UIBarButtonItem){
        let mySecondViewController: UIViewController = comentViewController()
        // Viewの移動する.
        self.navigationController?.pushViewController(mySecondViewController, animated: true)
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
