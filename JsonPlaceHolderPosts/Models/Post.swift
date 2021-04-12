//
//  Post.swift
//  JsonPlaceHolderPosts
//
//  Created by Lakhlifi Essaddiq on 4/12/21.
//

import UIKit
class Post: NSObject {

    let userId: Int
    let id : Int
    let title:  String
    let body: String
    
    init(id : Int , userId: Int ,  title: String , body : String){
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
    
}
