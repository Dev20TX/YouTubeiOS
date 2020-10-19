//
//  Video.swift
//  YouTubeiOS
//
//  Created by Ryan Bennett on 10/18/20.

import Foundation

//MARK: 2
//Each instance of this Video struct will represent a video we are going to display
struct Video : Decodable { //MARK:3
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    //2
    enum CodingKeys: String, CodingKey { //MARK:5
        
        case snippet
        case thumbnails
        case high
        case resourceId
    
        //get the key-value pair from JSON data for each object
        case published = "publishedAt"
        //if key-value is the same, we can simply type the name of the object once
        case title
        case description
        //the url will be the key-value in this case
        case thumbnail = "url"
        case videoId
}
    
    init (from decoder: Decoder) throws { //MARK:4
        
        //get all information from JSON container/object - write "try" because it may throw an error - assign it to a constant because it is going to return a container
        let container = try decoder.container(keyedBy: CodingKeys.self) //MARK:6
    
        //gets snippit container
        let snippitContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet) 
    
        //parse title
        self.title = try snippitContainer.decode(String.self, forKey: .title)
        //parse description
        self.description = try snippitContainer.decode(String.self, forKey: .description)
        //parse publish date
        self.published = try snippitContainer.decode(Date.self, forKey: .published)
        //parse thumbnails
        let thumbnailContainer = try snippitContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
       
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        //parse video id
        
        let resourceContainer = try snippitContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceContainer.decode(String.self, forKey: .videoId)
        //6
}
}
