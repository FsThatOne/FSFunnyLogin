//
//  FSLoginViewController.swift
//  FSFunnyLogin
//
//  Created by FS小一 on 15/10/30.
//  Copyright © 2015年 FSxiaoyi. All rights reserved.
//

import UIKit

enum FsLoginTypeShow{
    case FsLoginTypeShow_User
    case FsLoginTypeShow_Pass
}

let mainSize = UIScreen.mainScreen().bounds.size

let offsetLeftHand: CGFloat = 60

var showType: FsLoginTypeShow = FsLoginTypeShow.FsLoginTypeShow_User

var loginView: UIView?

var loginImg: UIImageView?

var userName: UITextField?

var passWord: UITextField?

var leftHandImg: UIImageView?

var rightHandImg: UIImageView?

var leftHandGoneImg: UIImageView?

var rightHandGoneImg: UIImageView?

class FSLoginViewController: UIViewController , UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        setupUI()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupUI(){
        //登陆框猫头鹰图
        loginImg = UIImageView(frame: CGRect(x: mainSize.width / 2 - 211 / 2, y: 100, width: 211, height: 109))
        loginImg!.image = UIImage(named: "owl-login")
        loginImg!.layer.masksToBounds = true
        view.addSubview(loginImg!)
        
        //输入框容器视图
        loginView = UIView(frame: CGRect(x: 15, y: 200, width: mainSize.width - 30, height: 160))
        loginView!.layer.borderWidth = 1
        loginView!.layer.borderColor = UIColor.blackColor().CGColor
        loginView!.backgroundColor = UIColor.whiteColor()
        view.addSubview(loginView!)
        
        //用户名
        userName = UITextField(frame: CGRect(x: 30, y: 30, width: loginView!.frame.width - 60, height: 44))
        userName!.delegate = self
        userName!.layer.cornerRadius = 5;
        userName!.layer.borderColor = UIColor.lightGrayColor().CGColor;
        userName!.layer.borderWidth = 0.5;
        userName!.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        userName!.leftViewMode = UITextFieldViewMode.Always;
        let imgUser = UIImageView(frame: CGRect(x: 11, y: 11, width: 22, height: 22))
        imgUser.image = UIImage(named: "iconfont-user")
        userName!.leftView?.addSubview(imgUser)
        loginView!.addSubview(userName!)
        
        
        //密码
        passWord = UITextField(frame: CGRect(x: 30, y: 90, width: loginView!.frame.width - 60, height: 44))
        passWord!.delegate = self
        passWord!.layer.cornerRadius = 5;
        passWord!.layer.borderColor = UIColor.lightGrayColor().CGColor;
        passWord!.layer.borderWidth = 0.5;
        passWord!.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        passWord!.leftViewMode = UITextFieldViewMode.Always;
        let imgPass = UIImageView(frame: CGRect(x: 11, y: 11, width: 22, height: 22))
        imgPass.image = UIImage(named: "iconfont-password")
        passWord!.leftView?.addSubview(imgPass)
        loginView!.addSubview(passWord!)
        
        //手rect1
        let rectLeftHand = CGRect(x: mainSize.width / 2 - 100, y: loginView!.frame.origin.y - 22, width: 40, height: 40)
        let rectRightHand = CGRect(x: mainSize.width / 2 + 62, y: loginView!.frame.origin.y - 22, width: 40, height: 40)
        //左手图1
        leftHandImg = UIImageView(frame: rectLeftHand)
        leftHandImg!.image = UIImage(named: "icon_hand")
        view.addSubview(leftHandImg!)
        
        //右手图1
        rightHandImg = UIImageView(frame: rectRightHand)
        rightHandImg!.image = UIImage(named: "icon_hand")
        view.addSubview(rightHandImg!)
        
        //手rect2
        let rectLeftHandGone = CGRect(x: 61 - offsetLeftHand, y: 90, width: 40, height: 65)
        let rectRightHandGone = CGRect(x: loginImg!.frame.size.width / 2 + 60, y: 90, width: 40, height: 65)
        
        //左手图2
        leftHandGoneImg = UIImageView(frame: rectLeftHandGone)
        leftHandGoneImg!.image = UIImage(named: "owl-login-arm-left")
        loginImg!.addSubview(leftHandGoneImg!)
        
        //右手图2
        rightHandGoneImg = UIImageView(frame: rectRightHandGone)
        rightHandGoneImg!.image = UIImage(named: "owl-login-arm-right")
        loginImg!.addSubview(rightHandGoneImg!)
        
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField == userName {
            if showType != .FsLoginTypeShow_Pass{
                showType = .FsLoginTypeShow_User
                return
            }
            showType = .FsLoginTypeShow_User
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                leftHandGoneImg!.frame = CGRect(x: 61 - offsetLeftHand, y: 90, width: 40, height: 65)
                rightHandGoneImg!.frame = CGRect(x: loginImg!.frame.size.width / 2 + 60, y: 90, width: 40, height: 65)
                leftHandImg!.frame = CGRect(x: mainSize.width / 2 - 100, y: loginView!.frame.origin.y - 22, width: 40, height: 40)
                rightHandImg!.frame = CGRect(x: mainSize.width / 2 + 62, y: loginView!.frame.origin.y - 22, width: 40, height: 40)
                }, completion: { (Bool) -> Void in
            })
            
        }else if textField == passWord {
            if showType != .FsLoginTypeShow_User{
                showType = .FsLoginTypeShow_Pass
                return
            }
            showType = .FsLoginTypeShow_Pass
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                leftHandGoneImg!.frame = CGRectMake(leftHandGoneImg!.frame.origin.x + offsetLeftHand, leftHandGoneImg!.frame.origin.y - 30, leftHandGoneImg!.frame.size.width, leftHandGoneImg!.frame.size.height);
                rightHandGoneImg!.frame = CGRectMake(rightHandGoneImg!.frame.origin.x - 48, rightHandGoneImg!.frame.origin.y - 30, rightHandGoneImg!.frame.size.width, rightHandGoneImg!.frame.size.height);
                
                leftHandImg!.frame = CGRect(x: leftHandImg!.frame.origin.x + 40 , y: loginView!.frame.origin.y, width: 0, height: 0)
                rightHandImg!.frame = CGRect(x: rightHandImg!.frame.origin.x - 40, y: loginView!.frame.origin.y, width: 0, height: 0)
                }, completion: { (Bool) -> Void in
            })
        }
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
