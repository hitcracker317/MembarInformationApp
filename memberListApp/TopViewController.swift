//
//  TopViewController.swift
//  memberListApp
//
//  Created by 前田 晃良 on 2015/10/14.
//  Copyright (c) 2015年 A.M. All rights reserved.
//

import UIKit

class TopViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var memberArray:[MemberInfoModel] = [MemberInfoModel]() //モデルクラスを格納する配列
    
    @IBOutlet weak var memberTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //カスタムセルのxibファイルを読み込む
        var nib:UINib = UINib(nibName: "MemberTableViewCell", bundle: nil)
        self.memberTableView.registerNib(nib, forCellReuseIdentifier: "Cell")
        
        //もうひとつのxibファイルを読み込む
        var nib2:UINib = UINib(nibName: "MemberTableViewCell2", bundle: nil)
        self.memberTableView.registerNib(nib2, forCellReuseIdentifier: "Cell2")
        
        
        /*
        //メンバー情報のオブジェクトを作成して、それらを配列に格納
        var member1 = MemberInfoModel(image: "image1.jpg", name: "sam", detail: "あああああ", birthday: "1999")
        var member2 = MemberInfoModel(image: "image2.jpg", name: "ねね", detail: "あああああ", birthday: "1989")
        var member3 = MemberInfoModel(image: "image3.jpg", name: "あな", detail: "あああああ", birthday: "1949")
        
        memberArray.append(member1)
        memberArray.append(member2)
        memberArray.append(member3)
        */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height:CGFloat = 0.0
        if(indexPath.row % 2 == 0){
            height = 100
        } else {
            height = 170
        }
        
        return height
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //カスタムセルを取得するときはtableViewのdequeueReusableCellWithIdentifierメソッドを使用する
        
        var cell:UITableViewCell = UITableViewCell()
        if(indexPath.row % 2 == 0){
            var cell1 = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MemberTableViewCell
            cell1.setCellInfo(memberArray[indexPath.row])
            cell = cell1
            
        } else {
            var cell2 = tableView.dequeueReusableCellWithIdentifier("Cell2", forIndexPath: indexPath) as! MemberTableViewCell2
            cell2.setCellInfo(memberArray[indexPath.row])
            cell = cell2
        }
        return cell
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("toDetail", sender: nil)
    }
    
    @IBAction func addMember(sender: AnyObject) {
        println("add!!")
    }
    
    //遷移先からこのビューコントローラーに戻るメソッド
    @IBAction func returnMenu(segue:UIStoryboardSegue){
        
    }

}
