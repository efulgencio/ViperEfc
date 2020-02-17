//
//  InfoInteractor.swift
//  ViperEfc
//
//  Created by eduardo fulgencio on 23/01/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation

class InfoInteractor: InfoInteractorInputProtocol{

    
    
    //var presenter: InteractorToPresenterProtocol?
    var presenter: InfoPresenter?
    
    func fetchGetInfo() {
         if true {
            presenter?.didFinishFetchingInfoResults(allSearches: ["contenido"], error: nil)
        } else {
            presenter?.didFinishFetchingInfoResults(allSearches: nil,
                            error: NSError.init(domain: "fetchGetInfo", code: 100, userInfo: ["Error" : "no data"]))
        }
    }
    
    func fetchGetApi() {
        WebServiceManager.sharedService.requestAPI(url: "", parameter: nil, httpMethodType: .GET) { (response, error) in
          DispatchQueue.main.async {
            guard let data = response else {
                self.presenter?.didFinishFetchingInfoResults(allSearches: nil,
                                        error: NSError.init(domain: "fetchGetInfo", code: 100, userInfo: ["Error" : "no data"]))
              return
            }
            
            let routeList = data as [String: String]
            
            if true {
                self.presenter?.didFinishFetchingInfoResults(allSearches: [routeList["clave"]!], error: nil)
            } else {
            //  self.presenter?.routeDetailFetched(route: nil, errorMessage: "No route found")
            }
          }
        }
    }
    
    func getRoute() {
        WebServiceManager.sharedService.requestAPI(url: "", parameter: nil, httpMethodType: .GET) { (response, error) in
          DispatchQueue.main.async {
            guard let data = response else {
              self.presenter?.routeDetailFetched(route: nil, errorMessage: error?.localizedDescription)
              return
            }
            
            let routeList = data as [String: String]
            
            if true {
                self.presenter?.routeDetailFetched(route: [routeList["clave"]!], errorMessage: nil)
            } else {
            //  self.presenter?.routeDetailFetched(route: nil, errorMessage: "No route found")
            }
          }
        }
     }

}

// en el método getRoute() es donde tiene que ir la llamada al servicio
//
//saveSearch(from: startLocation, to: endLocation)
//let googleDirectionsURL = WebServiceAPIPaths.googleDirectionsAPIPath + "origin=\(startLocation)&destination=\(endLocation)&mode=driving&key=\(GoogleAPIConstants.key)"
//
//WebServiceManager.sharedService.requestAPI(url: googleDirectionsURL, parameter: nil, httpMethodType: .GET) { (response, error) in
//  DispatchQueue.main.async {
//    guard let data = response else {
//      self.presenter?.routeDetailFetched(route: nil, errorMessage: error?.localizedDescription)
//      return
//    }
//    let routeList = data["routes"] as! [[String: AnyObject]]
//    if routeList.count > 0 {
//      self.presenter?.routeDetailFetched(route: GoogleRoute(routeAttributes: routeList[0]), errorMessage: nil)
//    } else {
//      self.presenter?.routeDetailFetched(route: nil, errorMessage: "No route found")
//    }
//
//  }
//}
