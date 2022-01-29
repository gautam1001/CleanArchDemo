//
//  PostLocalDataSource.swift
//  Data
//
//  Created by Prashant Gautam on 27/01/22.
//

import Foundation
import Domain

public protocol PostLocalDataSourceInterface {
    func getCachedPosts(handler: @escaping ([PostEntity]) -> ())
}
