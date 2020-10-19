//
//  Response.swift
//  YouTubeiOS
//
//  Created by Ryan Bennett on 10/18/20.
//

import Foundation

struct Response : Decodable {
    
    //array of Video objects
    //MARK:8
    var items: [Video]?
    
    enum CodingKeys:String, CodingKey {
        
        //get response of keys we are interested in
    case items
    }
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
        //8
    }
}
