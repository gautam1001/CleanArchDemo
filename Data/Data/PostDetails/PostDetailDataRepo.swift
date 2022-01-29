//
//  PostDetailDataRepo.swift
//  Data
//
//  Created by Prashant Gautam on 28/01/22.
//

import Foundation
import Domain

public class PostDetailDataRepo: PostDetailDomainRepoInterface {
    
    let postRemoteDataSource: PostDetailRemoteDataSourceInterface
    let postLocalDataSource: PostDetailLocalDataSourceInterface?
    
    public init(remoteDataSource: PostDetailRemoteDataSourceInterface,
                  localDataSource: PostDetailLocalDataSourceInterface? = nil) {
          
          self.postRemoteDataSource = remoteDataSource
          self.postLocalDataSource = localDataSource
    }
    
    public func getPostDetails(handler: @escaping (PostEntity?) -> ()) {
        self.postRemoteDataSource.getPostDetails { postModel in
            handler(postModel?.dotPostEntity())
        }
    }
}
