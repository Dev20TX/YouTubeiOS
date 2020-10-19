//
//  ViewController.swift
//  YouTubeiOS
//
//  Created by Ryan Bennett on 10/17/20.
//

import UIKit



    //conforming to protocols
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {

    
    //MARK:12

    @IBOutlet weak var tableView: UITableView! //MARK:11
    
    //MARK: 4
    var model = Model()
    var videos = [Video]() //MARK:14
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ViewController assigns itself as the datasource of the tableview and the delegate
        tableView.dataSource = self //MARK: 13
        tableView.delegate = self //MARK: 14
        //Set itself as the delegate of the model
        model.delegate = self //MARK:17
    
        model.getVideos()
        
    }
    
    //MARK:17 - Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        //set the returned videos to our video property
        self.videos = videos
        //refresh the tableview
            self.tableView.reloadData()
    }
    
        //methods tableview needs to call in order for data to display
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //number of rows will be how many videos we have in [Video] array
        return videos.count
    }
    
    //MARK:15 - TableView Methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //choosing the prototype cell we want to use
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) //MARK:15
        
        //configure the cell with the data
        
        //get the title for video in question
        let title = self.videos[indexPath.row].title //MARK:19
        cell.textLabel?.text = title
        
        //return the cell
        return cell
    }

}

