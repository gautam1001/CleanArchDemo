//
//  PostDI.swift
//  MassiveToBe
//
//  Created by Prashant Gautam on 27/01/22.
//

import Foundation
import Domain
import Data
import Presentation

class PostDI {
    
    let appEnvironment: AppEnvironment
    
    init(appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }
    
    func postDependencies() -> PostViewModel {
            
            // Data Layer
            let baseURL = appEnvironment.baseURL
            
            // Post Data Source
            let postRemoteDataSource = PostRemoteDataSource(urlString: baseURL)
            
            // Post Data Repo
            let postDataRepo = PostDataRepo(postRemoteDataSource: postRemoteDataSource)
            
            // Domain Layer
            let postInteractor = PostInteractor(postDomainRepo: postDataRepo)
            
            // Presentation
            let postVM = PostViewModel(postInteractor: postInteractor)
            
            return postVM
        }
    
}


