//
//  ViewController.swift
//  ViperEfc
//
//  Created by eduardo fulgencio on 23/01/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import UIKit

class InfoController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //var presenter:ViewToPresenterProtocol = ViewToPresenterProtocol()
    var presenter: InfoPresenter = InfoPresenter()
    var infoArrayList:Array<InfoModel> = Array()
    var elementos: [String] = ["a"]
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewRef = self //The view reference for presenter of this screen.
        presenter.viewDidLoad() //Inform the presenter about the view loading.
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        
    }

}

//MARK: SearchPresenterProtocol
extension InfoController: InfoPresenterProtocol {
    func updateTheRecentInfoList(recentSavedInfo: [String:String]?, error: Error?) {
        elementos = [recentSavedInfo!["clave"]!]
        tableView.reloadData()
    }
}

extension InfoController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elementos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = elementos[indexPath.row]
        return cell
    }
    
}

extension InfoController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.getRouteButtonPressedFor()
    }
    
}
