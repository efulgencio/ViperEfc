//
//  InfoInteractor.swift
//  ViperEfc
//
//  Created by eduardo fulgencio on 23/01/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation

class InfoInteractor: PresenterToInteractorProtocol{
    
    var presenter: InteractorToPresenterProtocol?
    
    func fetchInfo() {
        // Aqui corresponde para llamar a la api y generar el array para enviarlo al presenter
        //  Alamofire.request("url_api").responseJSON { response in
        //         if(response.response?.statusCode == 200){
        //              if let json = response.result.value as AnyObject? {
        //              }
        //          }else {
        //              self.presenter?.noticeFetchFailed()
        //          }
        //       }

        if true {
            self.presenter?.infoFetchedSuccess(infoModelArray: [InfoModel(map: ["id":"1","title":"casa"])!])
        }else {
            self.presenter?.infoFetchFailed()
        }
    }
}
