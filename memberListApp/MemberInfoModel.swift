//
//  MemberInfoModel.swift
//  memberListApp
//
//  Created by 前田 晃良 on 2015/10/15.
//  Copyright (c) 2015年 A.M. All rights reserved.
//

import UIKit

class MemberInfoModel: NSObject {
    
    var imageString : String?
    var nameString : String?
    var detailString : String?
        
    init(image:String,name:String,detail:String){
        imageString = image
        nameString = name
        detailString = detail
    }
}
