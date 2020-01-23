//
//  InfoRouter.swift
//  ViperEfc
//
//  Created by eduardo fulgencio on 23/01/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation
import UIKit

class InfoRouter:PresenterToRouterProtocol{
    
    static func createModule() -> InfoViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
        
        // InfoPresenter tiene el protocolo ViewToPresenterProtocol y una extensión con InteractorToPresenterProtocol
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = InfoPresenter()
        let interactor: PresenterToInteractorProtocol = InfoInteractor()
        let router:PresenterToRouterProtocol = InfoRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func pushToNextScreen(navigationConroller navigationController:UINavigationController) {
        
//        let otroModue = OtroModuloRouter.createMovieModule()
//        navigationController.pushViewController(otroModue,animated: true)
        
    }
    
}
