//
//  PostDataRepo.swift
//  Data
//
//  Created by Prashant Gautam on 27/01/22.
//

import Foundation
import Domain


public class PostDataRepo: PostDomainRepoInterface {
    
    let postRemoteDataSource: PostRemoteDataSourceInterface
    let postLocalDataSource: PostLocalDataSourceInterface?
    //let coder:Coder
    
    public init(postRemoteDataSource: PostRemoteDataSourceInterface,
                  postLocalDataSource: PostLocalDataSourceInterface? = nil) {
          
          self.postRemoteDataSource = postRemoteDataSource
          self.postLocalDataSource = postLocalDataSource
          
          //self.coder = coder
    }
    
    public func getPosts(handler: @escaping ([PostEntity]) -> ()) {
            
            postRemoteDataSource.getPosts { (postModels) in
                
                var postEntities = [PostEntity]()
                for postModel in postModels {
                    postEntities.append(postModel.dotPostEntity())
                }
                
                handler(postEntities)
            }
    }
}
