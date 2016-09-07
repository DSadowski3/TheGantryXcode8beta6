//
//  Post.swift
//  TheGantry
//
//  Created by Dominik Sadowski on 9/6/16.
//  Copyright © 2016 Dominik Sadowski. All rights reserved.
//

import Foundation

class Post {
    
    private var _caption: String!
    private var _imgUrl: String!
    private var _likes: Int!
    private var _postKey: String!
    
    var caption: String {
        return _caption
    }
    
    var imgUrl: String {
        return _imgUrl
    }
    
    var likes: Int {
        return _likes
    }
    
    var postKey: String {
        return _postKey
    }
    
    init(caption: String, imgUrl: String, likes: Int) {
        self._caption = caption
        self._imgUrl = imgUrl
        self._likes = likes
    }
    
    init(postKey: String, postData: Dictionary<String, AnyObject>) {
        self._postKey = postKey
        
        if let caption = postData["caption"] as? String{
            self._caption = caption
        }
        
        if let imgUrl = postData["imageUrl"] as? String{
            self._imgUrl = imgUrl
        }
        
        if let likes = postData["likes"] as? Int{
            self._likes = likes
        }
    }
}
