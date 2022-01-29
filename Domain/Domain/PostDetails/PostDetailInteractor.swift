//
//  PostDetailInteractor.swift
//  Domain
//
//  Created by Prashant Gautam on 28/01/22.
//

import Foundation

public protocol PostDetailInteractorInterface {
    
    func getPostDetails(handler: @escaping (PostEntity?) -> ())
}

public class PostDetailInteractor: PostDetailInteractorInterface {
    
    let postDetailDomainRepo: PostDetailDomainRepoInterface
    
    public init(domainRepo:PostDetailDomainRepoInterface) {
        self.postDetailDomainRepo = domainRepo
    }
    
    public func getPostDetails(handler: @escaping (PostEntity?) -> ()) {
        self.postDetailDomainRepo.getPostDetails { entity in
            handler(entity)
        }
    }
}
