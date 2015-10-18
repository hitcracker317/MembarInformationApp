//
//  MemberTableViewCell.swift
//  memberListApp
//
//  Created by 前田 晃良 on 2015/10/16.
//  Copyright (c) 2015年 A.M. All rights reserved.
//

import UIKit

class MemberTableViewCell: UITableViewCell {
    
    //モデルのプロパティ
    @IBOutlet weak var memberNameLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //モデルオブジェクトに値をセットするメソッドを用意
    func setCellInfo(memberInfoModel:MemberInfoModel){
        memberNameLabel.text = memberInfoModel.nameString
        
        var imageStr = memberInfoModel.imageString
        thumbnailImageView.image = UIImage(named: imageStr!)
        thumbnailImageView.layer.cornerRadius = thumbnailImageView.frame.size.width / 2
        thumbnailImageView.layer.borderWidth = 5
        thumbnailImageView.layer.borderColor = UIColor(red:255/255 , green:241/255 , blue:15/255 , alpha:1 ).CGColor
    }
}
