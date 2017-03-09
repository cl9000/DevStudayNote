//
//  ViewController.swift
//  Swift_01
//
//  Created by 魏长露 on 16/8/31.
//  Copyright © 2016年 魏长露. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {

    /// 滚动控件
    fileprivate var scrollView: UIScrollView!;
    /// 文本控件
    fileprivate var lblView : UILabel!;
    /// 按钮控件
    fileprivate var btnView : UIButton!;
    /// 输入框控件
    fileprivate var textFieldView : UITextField!;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "SWIFT_首页";
        self.layoutUI();
        
        
        guard true else {
            //ture 直接跳过 
            print("1234567890");
            return
        }
        
        
        
        
        
//－－－－－－－－－－－－－－－－－－－－－－－－分割线－－－－－－－－－－－－－－－－－－－－－－－－－
//switch语句用法
        let someCharacter:Character = "B";
        switch someCharacter {
        case "a":break;
        case "A", "B":
            print("AAAAA");
        default:
            print("NO");
        }
       
        let approximateCount = 63;
        let countedThings = "hello";
        var naturalCount : String;
        switch approximateCount {
        case 0:
            naturalCount = "NO";
        case 1..<5:
            naturalCount = "a few";
        case 5..<100:
            naturalCount = "dozens of";
        default:
            naturalCount = "many";
        }
        print("There are \(naturalCount) \(countedThings)");
        
        let somePoint = (1, 0);
        switch somePoint {
        case (0, 0):
            print("(0, 0) is at origin");
        case (_, 0):
            print("(\(somePoint.0), 0) is on x_axis");
        case (0, _):
            print("(0, (\(somePoint.1)) is on y_axis)");
        case (-2...2, -2...2):
            print("(\(somePoint.0), \(somePoint.1)) is inside the box");
        default:
            print("(\(somePoint.0), \(somePoint.1)) is outside the box");
        }
        
        
        let anotherPoint = (0, 3);
        switch anotherPoint {
        case (let x, 0):
            print("on the x-axis with an x value of \(x)");
        case (0, let y):
            print("on the y-axis with an y value of \(y)");
        case let (x, y):
            print("somewhere else at (\(x), \(y))")
        }
        
        //把点（x, y）进行分类
        let yetAnotherPoint = (1, -1);
        switch yetAnotherPoint {
        case let (x, y) where x == y:
            print("(\(x), \(y)) is on the line x == y");
        case let (x, y) where x == -y:
            print("(\(x), \(y)) is on the line x == -y");
        case let (x, y):
            print("(\(x), \(y)）is just some arbitrary point");
        }
        
        //贯穿
        let integerToDescribe = 5;
        var description = "the number is \(integerToDescribe) is";
        switch integerToDescribe {
        case 2, 3, 5, 7, 9, 11 :
            description += " a prime number, and also";
            fallthrough;
        default:
            description += " an integer";
        }
        print(description);
        
        func makeIncrementer() -> ((Int) -> Int){
        func addOne(_ number:Int)->Int{
            return 1 + number
        }
        return addOne
    }
        let increment = makeIncrementer();
        print(increment(7));


    }


    fileprivate func layoutUI(){
        //滚动控件
        self.scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height));
        self.scrollView.showsHorizontalScrollIndicator = true;
        self.scrollView.showsVerticalScrollIndicator = true;
        self.scrollView.contentSize = CGSize(width: self.view.bounds.width, height: 1000);
        self.scrollView.backgroundColor = UIColor.brown;
        self.view.addSubview(self.scrollView);
        
        //
        self.lblView = UILabel(frame: CGRect(x: 10, y: 20, width: 100, height: 45));
        self.lblView.backgroundColor = UIColor.white;
        self.lblView.text = "label";
        self.lblView.layer.cornerRadius = 3;
        self.lblView.clipsToBounds = true;
        self.scrollView.addSubview(self.lblView);
        
        //
        self.btnView = UIButton(frame: CGRect(x: 10, y: self.lblView.frame.maxY+10, width: 100, height: 35));
        self.btnView.backgroundColor = UIColor.white;
        self.btnView.setTitle("按钮", for: UIControlState());
        self.btnView.setTitleColor(UIColor.black, for: UIControlState());
        self.scrollView.addSubview(self.btnView);
        
        //
        self.textFieldView = UITextField(frame: CGRect(x: 10, y: self.btnView.frame.maxY+10, width: 145, height: 25));
        self.textFieldView.backgroundColor = UIColor.white;
        self.textFieldView.placeholder = "请输入...";
//        self.textFieldView.clearsOnBeginEditing = true;
        self.textFieldView.clearButtonMode = .always;
        self.textFieldView.delegate = self;
        self.scrollView.addSubview(self.textFieldView);
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

