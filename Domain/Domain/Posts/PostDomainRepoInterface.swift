//
//  PostDomainRepoInterface.swift
//  Domain
//
//  Created by Prashant Gautam on 27/01/22.
//

import Foundation

public protocol PostDomainRepoInterface {
    
    func getPosts(handler: @escaping ([PostEntity]) -> ())
}
