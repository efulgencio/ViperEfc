//
//  InfoPresenter.swift
//  ViperEfc
//
//  Created by eduardo fulgencio on 23/01/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation
import UIKit

class InfoPresenter:ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    func startFetchingInfo() {
        interactor?.fetchInfo()
    }
    
    func showMovieController(navigationController: UINavigationController) {
        router?.pushToNextScreen(navigationConroller:navigationController)
    }

}

extension InfoPresenter: InteractorToPresenterProtocol{
    
    func infoFetchedSuccess(infoModelArray: Array<InfoModel>) {
        view?.showInfo(infoArray: infoModelArray)
    }
    
    func infoFetchFailed() {
        view?.showError()
    }
    
}
