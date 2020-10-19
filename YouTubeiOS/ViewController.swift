//
//  ViewController.swift
//  YouTubeiOS
//
//  Created by Ryan Bennett on 10/17/20.
//

import UIKit

//MARK: 4
var model = Model()
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.getVideos()
        //4
    }


}

