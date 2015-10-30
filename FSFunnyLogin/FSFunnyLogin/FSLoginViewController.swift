//
//  FSLoginViewController.swift
//  FSFunnyLogin
//
//  Created by FS小一 on 15/10/30.
//  Copyright © 2015年 FSxiaoyi. All rights reserved.
//

import UIKit

enum FsLoginTypeShow{
    case FsLoginTypeShow_None
    case FsLoginTypeShow_User
    case FsLoginTypeShow_Pass
}

let vLogin = UIView(frame: CGRect(x: 15, y: 200, width: mainSize.width - 30, height: 160));

let imgLogin = UIView(frame: CGRect(x: mainSize.width / 2 - 211 / 2, y: 100, width: 211, height: 109))

let mainSize = UIScreen.mainScreen().bounds.size

let offsetLeftHand = 60

let rectLeftHand = CGRect(x: 61 - offsetLeftHand, y: 90, width: 40, height: 70)

let rectRightHand = CGRect(x: imgLogin.frame.size.width / 2 + 60, y: 90, width: 40, height: 70)

let rectLeftHandGone = CGRect(x: mainSize.width / 2 - 100, y: vLogin.frame.origin.y - 22, width: 40, height: 40)

let rectRightHandGone = CGRect(x: mainSize.width / 2 + 62,y: vLogin.frame.origin.y - 22, width: 40, height: 40)

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
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
    }
    
    func setupUI(){
        //登陆框猫头鹰图
        let loginImg = UIImageView(frame: CGRect(x: mainSize.width / 2 - 211 / 2, y: 100, width: 211, height: 109))
        loginImg.image = UIImage(named: "owl-login")
        loginImg.layer.masksToBounds = true
        self.view.addSubview(loginImg)
        
        //左手图1
        let leftHandImg = UIImageView(frame: rectLeftHand)
        leftHandImg.image = UIImage(named: "icon_hand")
        loginImg.addSubview(leftHandImg)
        
        //右手图1
        let rightHandImg = UIImageView(frame: rectRightHand)
        rightHandImg.image = UIImage(named: "icon_hand")
        loginImg.addSubview(rightHandImg)
        
        //输入框容器视图
        let loginView = UIView(frame: CGRect(x: 15, y: 200, width: mainSize.width - 30, height: 160))
        loginView.layer.borderWidth = 1
        loginView.layer.borderColor = UIColor.blackColor().CGColor
        loginView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(loginView)
        
        //用户名
        let userName = UITextField(frame: CGRect(x: 30, y: 30, width: vLogin.bounds.width - 60, height: 44))
        userName.delegate = self
        userName.layer.cornerRadius = 5;
        userName.layer.borderColor = UIColor.lightGrayColor().CGColor;
        userName.layer.borderWidth = 0.5;
        userName.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        userName.leftViewMode = UITextFieldViewMode.Always;
        let imgUser = UIImageView(frame: CGRect(x: 11, y: 11, width: 22, height: 22))
        imgUser.image = UIImage(named: "iconfont-user")
        userName.leftView?.addSubview(imgUser)
        loginView.addSubview(userName)
        
        //密码
        let passWord = UITextField(frame: CGRect(x: 30, y: 90, width: vLogin.bounds.width - 60, height: 44))
        passWord.delegate = self
        passWord.layer.cornerRadius = 5;
        passWord.layer.borderColor = UIColor.lightGrayColor().CGColor;
        passWord.layer.borderWidth = 0.5;
        passWord.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        passWord.leftViewMode = UITextFieldViewMode.Always;
        let imgPass = UIImageView(frame: CGRect(x: 11, y: 11, width: 22, height: 22))
        imgPass.image = UIImage(named: "iconfont-password")
        passWord.leftView?.addSubview(imgPass)
        loginView.addSubview(passWord)
        
        
        //左手图2
        let leftHandGoneImg = UIImageView(frame: rectLeftHandGone)
        
        //右手图2
        let rightHandGoneImg = UIImageView(frame: rectRightHandGone)
        
        let showType :FsLoginTypeShow?
        
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
