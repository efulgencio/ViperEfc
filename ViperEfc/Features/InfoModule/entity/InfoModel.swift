//
//  InfoModel.swift
//  ViperEfc
//
//  Created by eduardo fulgencio on 23/01/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation
// import ObjectMapper  pertenece a AlamofireMappedObject

private let ID = "id"
private let TITLE = "title"

class InfoModel {
    
    internal var id:String?
    internal var title:String?
    
    required init?(map:[String:String]) { // Dictionary<String, String>
        id = map["id"]
        title = map["title"]
    }
    
}
