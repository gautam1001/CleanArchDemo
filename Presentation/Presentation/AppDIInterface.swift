//
//  AppDIInterface.swift
//  Presentation
//
//  Created by Prashant Gautam on 28/01/22.
//

import Foundation


public protocol AppDIInterface {
    
    func postDependencies() -> PostViewModel
    
    func postDetailsDependencies(postId:Int) -> PostDetailsVM
}
