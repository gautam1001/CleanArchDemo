//
//  PostViewModel.swift
//  Presentation
//
//  Created by Prashant Gautam on 27/01/22.
//

import Foundation
import Domain

public class PostViewModel: ObservableObject {
    
    @Published var posts: [PostEntity] = []
    
    private var postInteractor: PostInteractorInterface
    
    public init(postInteractor: PostInteractorInterface) {
        self.postInteractor = postInteractor
    }
    
    func getPosts() {
        
        self.postInteractor.getPosts { [weak self] (postArray) in
            DispatchQueue.main.async {
                self?.posts = postArray
            }
        }
    }
}
