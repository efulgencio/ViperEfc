//
//  File.swift
//  ViperEfc
//
//  Created by eduardo fulgencio on 17/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation

class WebServiceManager: NSObject {
  
  static let sharedService = WebServiceManager()
  
  typealias WebServiceCompletionBlock = (_ data: [String:String]?,_ error: Error?)->Void
  
  enum HTTPMethodType: Int {
    case POST = 0
    case GET
  }
  
  func requestAPI(url: String,parameter: [String: AnyObject]?, httpMethodType: HTTPMethodType,
                  completion: @escaping WebServiceCompletionBlock) {
        do {
          completion(["clave":"contenido"],nil)
        } catch let error {
          completion(nil,error)
        }
  }
  

}
