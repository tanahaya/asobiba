import UIKit

class informationsViewController: UIViewController, UIScrollViewDelegate  {
    
    
    var storeImageView: UIImageView!
    
    var scrollBeginingPoint: CGPoint!
    
    var pageControl: UIPageControl!
    // UIScrillView.
    var scrollViewMain: UIScrollView!
    var postButton:UIBarButtonItem!
    // ページ番号.
    let pageSize = 4
    let menus:[String] = ["Home","写真","口コミ","地図"]
    
    let colorBg1 = UIColor(red: 250/255, green: 124/255, blue: 146/255, alpha: 1.0)
    let colorBg2 = UIColor(red: 110/255, green: 196/255, blue: 219/255, alpha: 1.0)
    let colorBg3 = UIColor(red: 60/255, green: 196/255, blue: 124/255, alpha: 1.0)
    let colorBg4 = UIColor(red: 255/255, green: 247/255, blue: 140/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let homeLabel:UILabel = UILabel(frame: CGRectMake(0, 00, 80, 30))
        homeLabel.backgroundColor = colorBg1
        homeLabel.textColor = UIColor.whiteColor()
        homeLabel.textAlignment = NSTextAlignment.Center
        homeLabel.layer.masksToBounds = true
        homeLabel.text = menus[0]
        homeLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        homeLabel.layer.cornerRadius = 10.0
        homeLabel.layer.position = CGPoint(x:50, y: 18)//width/2
        
        self.view.addSubview(homeLabel)
        
        let imageLabel:UILabel = UILabel(frame: CGRectMake(0, 00, 80, 30))
        imageLabel.backgroundColor = colorBg2
        imageLabel.textColor = UIColor.whiteColor()
        imageLabel.textAlignment = NSTextAlignment.Center
        imageLabel.layer.masksToBounds = true
        imageLabel.text = menus[1]
        imageLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        imageLabel.layer.cornerRadius = 10.0
        imageLabel.layer.position = CGPoint(x:140, y: 18)//width/4 + width/2
        
        self.view.addSubview(imageLabel)
        
        let comentLabel:UILabel = UILabel(frame: CGRectMake(0, 00, 80, 30))
        comentLabel.backgroundColor = colorBg3
        comentLabel.textColor = UIColor.whiteColor()
        comentLabel.textAlignment = NSTextAlignment.Center
        comentLabel.layer.masksToBounds = true
        comentLabel.text = menus[2]
        comentLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        comentLabel.layer.cornerRadius = 10.0
        comentLabel.layer.position = CGPoint(x:230, y: 18)//2 * width/4 + width/2
        
        self.view.addSubview(comentLabel)
        
        let mapLabel:UILabel = UILabel(frame: CGRectMake(0, 00, 80, 30))
        mapLabel.backgroundColor = colorBg4
        mapLabel.textColor = UIColor.blackColor()
        mapLabel.textAlignment = NSTextAlignment.Center
        mapLabel.layer.masksToBounds = true
        mapLabel.text = menus[3]
        mapLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        mapLabel.layer.cornerRadius = 10.0
        mapLabel.layer.position = CGPoint(x:320, y: 18)//3 * width/4 + width/2
        
        self.view.addSubview(mapLabel)
        
        
        
        self.navigationItem.title = "ラーメン" + "の店舗情報"
        
        postButton = UIBarButtonItem(title: "投稿する", style: .Plain, target: self, action: "movepost:")
        self.navigationItem.rightBarButtonItem = postButton
        let width = self.view.frame.maxX, _ = self.view.frame.maxY
        
        // ScrollViewMainの設定.
        scrollViewMain = UIScrollView(frame: self.view.frame)
        scrollViewMain.showsHorizontalScrollIndicator = false
        scrollViewMain.showsVerticalScrollIndicator = false
        scrollViewMain.pagingEnabled = true
        scrollViewMain.delegate = self
        scrollViewMain.contentSize = CGSizeMake(CGFloat(pageSize) * width, 0)
        self.view.addSubview(scrollViewMain)
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        // ScrollView1に貼付けるLabelの生成.
        
        let homeView:UIView = UIView(frame: CGRectMake(0,0, 370, 520))
        homeView.backgroundColor = colorBg1
        homeView.layer.position = CGPoint(x: width/2, y: 300)
        scrollViewMain.addSubview(homeView)
        
        
        let imageView:UIView = UIView(frame: CGRectMake(0,0, 370, 520))
        imageView.backgroundColor = colorBg2
        imageView.layer.position = CGPoint(x: width + width/2, y: 300)
        scrollViewMain.addSubview(imageView)

        
        
        
        let comentView:UIView = UIView(frame: CGRectMake(0,0, 370, 520))
        comentView.backgroundColor = colorBg3
        comentView.layer.position = CGPoint(x: 2 * width + width/2, y: 300)
        scrollViewMain.addSubview(comentView)

        
        let mapView:UIView = UIView(frame: CGRectMake(0,0, 370, 520))
        mapView.backgroundColor = colorBg4
        mapView.layer.position = CGPoint(x: 3 * width + width/2, y: 300)
        scrollViewMain.addSubview(mapView)



        storeImageView = UIImageView(frame: CGRectMake(0,0,350,200))
        
        // 表示する画像を設定する.
        let myImage = UIImage(named: "storeMain.jpg")
        
        // 画像をUIImageViewに設定する.
        storeImageView.image = myImage
        
        // 画像の表示する座標を指定する.
        storeImageView.layer.position = CGPoint(x: self.view.bounds.width/2, y: 212.0)
        
        // UIImageViewをViewに追加する.
        scrollViewMain.addSubview(storeImageView)
        
        
        
        
        let nameLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
        // 背景をオレンジ色にする.
        nameLabel.backgroundColor = UIColor.whiteColor()
        // 枠を丸くする.
        nameLabel.layer.masksToBounds = true
        // コーナーの半径.
        nameLabel.layer.cornerRadius = 20.0
        // Labelに文字を代入.
        nameLabel.text = "ラーメン"
        // 文字の色を白にする.
        nameLabel.textColor = UIColor.blackColor()
        // Textを中央寄せにする.
        nameLabel.textAlignment = NSTextAlignment.Center
        // 配置する座標を設定する.
        nameLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 340)
        scrollViewMain.addSubview(nameLabel)
        
        
        let allLabel: UILabel = UILabel(frame: CGRectMake(0,0,160,50))
        // 背景をオレンジ色にする.
        allLabel.backgroundColor = UIColor.whiteColor()
        // 枠を丸くする.
        allLabel.layer.masksToBounds = true
        // コーナーの半径.
        allLabel.layer.cornerRadius = 10.0
        // Labelに文字を代入.
        allLabel.text = "総合" + "3.6" + "点"
        // 文字の色を白にする.
        allLabel.textColor = UIColor.blackColor()
        // Textを中央寄せにする.
        allLabel.textAlignment = NSTextAlignment.Center
        allLabel.layer.cornerRadius = 4
        // 配置する座標を設定する.
        allLabel.layer.position = CGPoint(x: 90,y: 400)
        scrollViewMain.addSubview(allLabel)
        
        let tatseLabel: UILabel = UILabel(frame: CGRectMake(0,0,160,50))
        // 背景をオレンジ色にする.
        tatseLabel.backgroundColor = UIColor.whiteColor()
        // 枠を丸くする.
        tatseLabel.layer.masksToBounds = true
        // コーナーの半径.
        tatseLabel.layer.cornerRadius = 10.0
        // Labelに文字を代入.
        tatseLabel.text = "味" + "3.6" + "点"
        // 文字の色を白にする.
        tatseLabel.textColor = UIColor.blackColor()
        // Textを中央寄せにする.
        tatseLabel.textAlignment = NSTextAlignment.Center
        tatseLabel.layer.cornerRadius = 4
        // 配置する座標を設定する.
        tatseLabel.layer.position = CGPoint(x: 90,y: 470)
        scrollViewMain.addSubview(tatseLabel)
        
        
        let cpLabel: UILabel = UILabel(frame: CGRectMake(0,0,160,50))
        // 背景をオレンジ色にする.
        cpLabel.backgroundColor = UIColor.whiteColor()
        // 枠を丸くする.
        cpLabel.layer.masksToBounds = true
        // コーナーの半径.
        cpLabel.layer.cornerRadius = 10.0
        // Labelに文字を代入.
        cpLabel.text = "CP" + "3.6" + "点"
        // 文字の色を白にする.
        cpLabel.textColor = UIColor.blackColor()
        // Textを中央寄せにする.
        cpLabel.textAlignment = NSTextAlignment.Center
        cpLabel.layer.cornerRadius = 4
        // 配置する座標を設定する.
        cpLabel.layer.position = CGPoint(x: 90,y: 540)
        scrollViewMain.addSubview(cpLabel)
        
        let todayLabel: UILabel = UILabel(frame: CGRectMake(0,0,160,100))
        // 背景をオレンジ色にする.
        todayLabel.backgroundColor = UIColor.whiteColor()
        // 枠を丸くする.
        todayLabel.layer.masksToBounds = true
        // コーナーの半径.
        todayLabel.layer.cornerRadius = 20.0
        // Labelに文字を代入.
        todayLabel.text = "本日\n開いています"
        // 文字の色を白にする.
        todayLabel.textColor = UIColor.blackColor()
        // Textを中央寄せにする.
        todayLabel.textAlignment = NSTextAlignment.Center
        // 配置する座標を設定する.
        todayLabel.layer.position = CGPoint(x: 280,y: 420)
        scrollViewMain.addSubview(todayLabel)

        let priceLabel: UILabel = UILabel(frame: CGRectMake(0,0,180,70))
        // 背景をオレンジ色にする.
        priceLabel.backgroundColor = UIColor.whiteColor()
        // 枠を丸くする.
        priceLabel.layer.masksToBounds = true
        // コーナーの半径.
        priceLabel.layer.cornerRadius = 5.0
        // Labelに文字を代入.
        priceLabel.text = "予算:約" + "1000円"
        // 文字の色を白にする.
        priceLabel.textColor = UIColor.blackColor()
        // Textを中央寄せにする.
        priceLabel.textAlignment = NSTextAlignment.Center
        // 配置する座標を設定する.
        priceLabel.layer.position = CGPoint(x: 280,y: 520)
        scrollViewMain.addSubview(priceLabel)

        
        
        // PageControlを作成.
        pageControl = UIPageControl(frame: CGRectMake(0, self.view.frame.maxY - 50, width, 50))
        pageControl.backgroundColor = UIColor.lightGrayColor()
        
        // PageControlするページ数を設定.
        pageControl.numberOfPages = pageSize
        
        // 現在ページを設定.
        pageControl.currentPage = 0
        pageControl.userInteractionEnabled = false
        
        self.view.addSubview(pageControl)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView == scrollViewMain {
            // scrollViewHeader.contentOffset.x = scrollViewMain.contentOffset.x/4
        }
    }
    
    /*
    移動が完了したら呼ばれる.
    */
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        // スクロール数が1ページ分になったら.
        if fmod(scrollViewMain.contentOffset.x, scrollViewMain.frame.maxX) == 0 {
            // ページの場所を切り替える.
            pageControl.currentPage = Int(scrollViewMain.contentOffset.x / scrollViewMain.frame.maxX)
        }
    }
    func movepost(sender: UIButton){
        let myeightViewController: UIViewController = comentViewController()
        
        // Viewの移動する.
        //self.presentViewController(myfourthViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(myeightViewController, animated: true)
        
        
    }
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        scrollBeginingPoint = scrollView.contentOffset;
    }
    
    }
