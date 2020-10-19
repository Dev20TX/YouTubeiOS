//
//  Model.swift
//  YouTubeiOS
//
//  Created by Ryan Bennett on 10/18/20.
//

import Foundation

//MARK: 3
class Model {
   
    func getVideos() {
        
        //create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        //get a URLSession object
        let session = URLSession.shared
        
        //Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //check if there were any errors
            if error != nil || data == nil {
             return
            }
            
            //MARK:9
            do {
                //parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                //decoding method
                let response = try decoder.decode(Response.self, from: data!)
                
                //dump everything from response into console to check if results return
               dump(response)
            }
            catch {
                
            }
            
            //9
        }
        //kick off the task
        
        dataTask.resume()
        //3
    }
}
