//
//  InfoPresenter.swift
//  ViperEfc
//
//  Created by eduardo fulgencio on 23/01/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation
import UIKit

class InfoPresenter: InfoViewProtocol {
    
    var viewRef: InfoController?//View reference of the main screen of this module i.e SearchController
    var infoWireframe: InfoWireframe? //Router reference for this module.
    var infoInteractor: InfoInteractor? // Interactor reference for this module.
    
    func viewDidLoad() {
      InfoWireframe.loadInfoPageComponents(withPresenter: self)//Load all the components for this module
      // infoInteractor?.fetchGetInfo() //Ask the interactor to update fetch the recent searches made by user.
        infoInteractor?.fetchGetApi()
    }
    
    func getRouteButtonPressedFor() {
      infoInteractor?.getRoute() //Ask the interactor to update fetch the route between start and end loacation.
    }

}

extension InfoPresenter: InfoInteractorOutputProtocol {
    func routeDetailFetched(route: [String]?, errorMessage: String?) {
        guard let sourceController = viewRef else {
          return
        }
        infoWireframe?.showDetail(from: sourceController, withRoute: route!)
    }
    
    func didFinishFetchingInfoResults(allSearches: [String]?, error: Error?) {
        viewRef?.updateTheRecentInfoList(recentSavedInfo: ["clave":allSearches![0]], error: nil) //Ask the view to update the recent search list
    }
}
