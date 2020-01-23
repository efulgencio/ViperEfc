//
//  ViewController.swift
//  ViperEfc
//
//  Created by eduardo fulgencio on 23/01/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    var presenter:ViewToPresenterProtocol?
    var infoArrayList:Array<InfoModel> = Array()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter?.startFetchingInfo()
    }

}

extension InfoViewController: PresenterToViewProtocol{
    
    func showInfo(infoArray: Array<InfoModel>) {
        self.infoArrayList = infoArray
    }
    
    func showError() {
        print("error")
    }
    
}
