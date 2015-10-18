//
//  MemberTableViewCell2.swift
//  memberListApp
//
//  Created by 前田 晃良 on 2015/10/16.
//  Copyright (c) 2015年 A.M. All rights reserved.
//

import UIKit

class MemberTableViewCell2: UITableViewCell {

    @IBOutlet weak var memberNameLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellInfo(memberInfoModel:MemberInfoModel){
        memberNameLabel.text = memberInfoModel.nameString
        
        var imageStr = memberInfoModel.imageString
        thumbnailImageView.image = UIImage(named: imageStr!)

    }
}
