//
//  PostDetailsDI.swift
//  CleanArchDemo
//
//  Created by Prashant Gautam on 28/01/22.
//

import Foundation
import Presentation
import Domain
import Data


class PostDetailsDI {
    
    let appEnvironment: AppEnvironment
    
    init(appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }
    
    func postDetailsDependencies(id:Int) -> PostDetailsVM {
        // Data Layer
        let baseURL = appEnvironment.baseURL + "/\(id)"
        // Post Data Source
        let postRemoteDataSource = PostDetailRemoteDataSource(urlString: baseURL, coder: JSONDecoder())
        // Post Data Repo
        let postDataRepo = PostDetailDataRepo(remoteDataSource: postRemoteDataSource, localDataSource: nil)
        // domain
        let interactor = PostDetailInteractor(domainRepo: postDataRepo)
        // Presentation
        let postDetailsVM = PostDetailsVM(interactor: interactor)
        
        return postDetailsVM
    }
}
