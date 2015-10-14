//
//  MemberInfoTableViewCell.swift
//  memberListApp
//
//  Created by 前田 晃良 on 2015/10/14.
//  Copyright (c) 2015年 A.M. All rights reserved.
//

import UIKit

class MemberInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func setCell(MemberInfoModel){
        //カスタムセルのビュー要素にモデルデータのプロパティを代入
        //thumbnailImageView.image = UIImage(named: MemberInfoModel.imageString)
        //nameLabel.text = MemberInfoModel.nameString
        //nameLabel.text = MemberInfoModel.detailString
        
    }
    
}
