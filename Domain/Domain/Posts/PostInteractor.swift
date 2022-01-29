//
//  PostInteractor.swift
//  Domain
//
//  Created by Prashant Gautam on 27/01/22.
//

import Foundation

public protocol PostInteractorInterface {
        
    func getPosts(handler: @escaping ([PostEntity]) -> ())
}

public class PostInteractor: PostInteractorInterface {
    
    let postDomainRepo: PostDomainRepoInterface
    
    public init(postDomainRepo: PostDomainRepoInterface) {
           
         self.postDomainRepo = postDomainRepo
    }
       
    public func getPosts(handler: @escaping ([PostEntity]) -> ()) {
        
        postDomainRepo.getPosts { modelArray in
            handler(modelArray)
        }
    }
}
