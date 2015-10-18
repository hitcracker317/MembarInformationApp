//
//  EditViewController.swift
//  memberListApp
//
//  Created by 前田 晃良 on 2015/10/18.
//  Copyright (c) 2015年 A.M. All rights reserved.
//

import UIKit

class EditViewController: UIViewController ,UIActionSheetDelegate{

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        thumbnailImageView.layer.cornerRadius = thumbnailImageView.frame.size.width/2
        thumbnailImageView.layer.borderWidth = 10
        thumbnailImageView.layer.borderColor = UIColor(red:255/255 , green:241/255 , blue:15/255 , alpha:1 ).CGColor
        thumbnailImageView.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).CGColor
        
        //UIImageViewをタップすることでメソッドを実行
        //let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "changeImage:")
        //thumbnailImageView.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeImage(sender: UITapGestureRecognizer) {
        //アクションシートを開く
        
        var sheet: UIActionSheet = UIActionSheet()
        let title: String = "Please choose a plan"
        sheet.title  = title
        sheet.delegate = self
        sheet.addButtonWithTitle("Cancel")
        sheet.addButtonWithTitle("写真を撮る")
        sheet.addButtonWithTitle("カメラロール")
        sheet.addButtonWithTitle("削除")
        
        // キャンセルボタンのindexを指定
        sheet.cancelButtonIndex = 0
        
        // UIActionSheet表示
        sheet.showInView(self.view)
    }

    func actionSheet(sheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        switch buttonIndex{
        case 1:
            //カメラを起動
            break;
        case 2:
            //カメラロール
            break;
        case 3:
            //写真を削除
            thumbnailImageView.image = nil
            break;
        default:
            break;
        }
    }
    
    @IBAction func saveButton(sender: AnyObject) {
        //save
        print("セーブしたお！")
    }

}
