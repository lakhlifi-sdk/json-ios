//
//  Album.swift
//  JsonPlaceHolderPosts
//
//  Created by Lakhlifi Essaddiq on 4/12/21.
//

import UIKit

class Album: NSObject {
    
    let userId : Int
    let id : Int
    let title : String
    
    init(userId: Int, id: Int, title: String) {
        self.userId = userId
        self.id = id
        self.title = title
    }
    
    

}
