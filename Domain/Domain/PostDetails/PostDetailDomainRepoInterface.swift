//
//  PostDetailDomainRepoInterface.swift
//  Domain
//
//  Created by Prashant Gautam on 28/01/22.
//

import Foundation

public protocol PostDetailDomainRepoInterface {
    
    func getPostDetails(handler: @escaping (PostEntity?) -> ())
}
