//
//  InfoProtocols.swift
//  ViperEfc
//
//  Created by eduardo fulgencio on 23/01/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation
import UIKit


protocol InfoViewProtocol {
  
  var viewRef: InfoController? {get set}
  var infoWireframe: InfoWireframe? {get set}
  var infoInteractor: InfoInteractor? {get set}
  //View -> Presenter
  func viewDidLoad()  
}

protocol InfoPresenterProtocol {
  //Presenter -> View
    func updateTheRecentInfoList(recentSavedInfo: [String:String]?, error: Error?)
}

protocol InfoInteractorInputProtocol {
    
  var presenter: InfoPresenter? {get set}
  //Presenter -> Interactor
  func fetchGetInfo()
  func fetchGetApi()
  func getRoute()
    
}

protocol InfoInteractorOutputProtocol {
  //Interactor -> Protocol
  func didFinishFetchingInfoResults(allSearches: [String]?,error: Error?)
    func routeDetailFetched(route: [String]?,errorMessage: String?)
}

protocol InfoWireframeProtocol {
  //Presenter -> Wireframe
  func showDetail(from controller: InfoController, withRoute route: [String])
}

//protocol ViewToPresenterProtocol: class {
//
//    var view: PresenterToViewProtocol? {get set}
//    var interactor: PresenterToInteractorProtocol? {get set}
//    var router: PresenterToRouterProtocol? {get set}
//    
//    func startFetchingInfo()
//    func showMovieController(navigationController:UINavigationController)
//
//}
//
//protocol PresenterToViewProtocol: class{
//    func showInfo(infoArray:Array<InfoModel>)
//    func showError()
//}
//
//protocol PresenterToRouterProtocol: class {
//    static func createModule()-> InfoViewController
//    func pushToNextScreen(navigationConroller:UINavigationController)
//}
//
//protocol PresenterToInteractorProtocol: class {
//    var presenter:InteractorToPresenterProtocol? {get set}
//    func fetchInfo()
//}
//
//protocol InteractorToPresenterProtocol: class {
//    func infoFetchedSuccess(infoModelArray:Array<InfoModel>)
//    func infoFetchFailed()
//}
