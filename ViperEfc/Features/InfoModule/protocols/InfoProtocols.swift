//
//  InfoProtocols.swift
//  ViperEfc
//
//  Created by eduardo fulgencio on 23/01/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    
    func startFetchingInfo()
    func showMovieController(navigationController:UINavigationController)

}

protocol PresenterToViewProtocol: class{
    func showInfo(infoArray:Array<InfoModel>)
    func showError()
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> InfoViewController
    func pushToNextScreen(navigationConroller:UINavigationController)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchInfo()
}

protocol InteractorToPresenterProtocol: class {
    func infoFetchedSuccess(infoModelArray:Array<InfoModel>)
    func infoFetchFailed()
}
