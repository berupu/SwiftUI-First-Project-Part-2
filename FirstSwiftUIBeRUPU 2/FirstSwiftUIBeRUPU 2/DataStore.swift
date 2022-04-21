//
//  DataStore.swift
//  FirstSwiftUIBeRUPU 2
//
//  Created by be RUPU on 28/1/22.
//

import SwiftUI
import Combine

class DataStore : ObservableObject {
    @Published var posts: [Post] = []
    
    init(){
        getPost()
    }
    
    func getPost() {
        Api().getPosts { (posts) in
            self.posts = posts
        }
    }
}
