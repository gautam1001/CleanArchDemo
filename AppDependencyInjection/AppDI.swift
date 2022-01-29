//
//  AppDI.swift
//  MassiveToBe
//
//  Created by Prashant Gautam on 27/01/22.
//

import Foundation
import Presentation


class AppDI: AppDIInterface {

    static let shared = AppDI(appEnvironment: AppEnvironment())
    
    let appEnvironment: AppEnvironment
    
    init(appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }
    
    func postDependencies() -> PostViewModel {
        
        let postDI: PostDI = PostDI(appEnvironment: appEnvironment)
        
        let postVM = postDI.postDependencies()
                
        return postVM
    }
  
    func postDetailsDependencies(postId: Int) -> PostDetailsVM {
        let postDetailsDI: PostDetailsDI = PostDetailsDI(appEnvironment: appEnvironment)
        
        let postDetailsVM = postDetailsDI.postDetailsDependencies(id: postId)
        
        return postDetailsVM
    }
    
    
    
}
