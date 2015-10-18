//
//  EditViewController.swift
//  memberListApp
//
//  Created by 前田 晃良 on 2015/10/18.
//  Copyright (c) 2015年 A.M. All rights reserved.
//

import UIKit

class EditViewController: UIViewController ,UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate , UITextFieldDelegate,UITextViewDelegate{

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var editScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        thumbnailImageView.layer.cornerRadius = thumbnailImageView.frame.size.width/2
        thumbnailImageView.clipsToBounds = true
        thumbnailImageView.layer.borderWidth = 10
        thumbnailImageView.layer.borderColor = UIColor(red:255/255 , green:241/255 , blue:15/255 , alpha:1 ).CGColor
        thumbnailImageView.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).CGColor
        
        nameTextField.delegate = self
        birthdayTextField.delegate = self
        detailTextView.delegate = self
        
        nameTextField.layer.borderColor = UIColor.blackColor().CGColor
        nameTextField.layer.borderWidth = 1
        birthdayTextField.layer.borderColor = UIColor.blackColor().CGColor
        birthdayTextField.layer.borderWidth = 1
        detailTextView.layer.borderColor = UIColor.blackColor().CGColor
        detailTextView.layer.borderWidth = 1
        
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
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
                let controller = UIImagePickerController()
                controller.delegate = self
                controller.sourceType = UIImagePickerControllerSourceType.Camera
                self.presentViewController(controller, animated: true, completion: nil)
            }
            break;
        case 2:
            //カメラロール
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
                let controller = UIImagePickerController()
                controller.delegate = self
                controller.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                self.presentViewController(controller, animated: true, completion: nil)
            } else {
                println("エラー")
            }
            break;
        case 3:
            //写真を削除
            thumbnailImageView.image = nil
            break;
        default:
            break;
        }
    }
    
    // 写真を選択した時に呼ばれる
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if info[UIImagePickerControllerOriginalImage] != nil {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            thumbnailImageView.image = image
            //println(image)
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //キーボードのリターンが押された際にキーボードを閉じる
        nameTextField.resignFirstResponder();
        nameTextField.text = nameTextField.text;
        
        birthdayTextField.resignFirstResponder();
        birthdayTextField.text = birthdayTextField.text;
        
        return true;
    }
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        println("テキストビュー開いたっすよ")
        //editScrollView.scrollEnabled = true
        
        UIView.animateWithDuration(0.3, animations:
            {() -> Void in
                self.editScrollView.contentOffset = CGPointMake(0, 150)
            },completion:nil
        );
        return true
    }
    
    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        UIView.animateWithDuration(0.3, animations:
            {() -> Void in
                self.editScrollView.contentOffset = CGPointMake(0, 0)
            },completion:nil
        );
        return true
    }
    
    
    @IBAction func returnTextView(sender: AnyObject) {
        self.view.endEditing(true);
    }
    
    
    @IBAction func saveButton(sender: AnyObject) {
        //save
        print("セーブしたお！")
    }

}
