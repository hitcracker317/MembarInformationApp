//
//  TopViewController.swift
//  memberListApp
//
//  Created by 前田 晃良 on 2015/10/14.
//  Copyright (c) 2015年 A.M. All rights reserved.
//

import UIKit

class TopViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var memberArray = []
    //var addView = AddInfoView()
    
    @IBOutlet weak var memberTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //カスタムセルのxibファイルを読み込む
        var nib:UINib = UINib(nibName: "MemberTableViewCell", bundle: nil)
        self.memberTableView.registerNib(nib, forCellReuseIdentifier: "Cell")
        
        //もうひとつのxibファイルを読み込む
        var nib2:UINib = UINib(nibName: "MemberTableViewCell2", bundle: nil)
        self.memberTableView.registerNib(nib2, forCellReuseIdentifier: "Cell2")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
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
            cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MemberTableViewCell
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier("Cell2", forIndexPath: indexPath) as! MemberTableViewCell2
        }
        return cell
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    @IBAction func addMember(sender: AnyObject) {
        println("add!!")
    }

}
