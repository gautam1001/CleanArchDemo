//
//  PostDetailLocalDataSource.swift
//  Data
//
//  Created by Prashant Gautam on 28/01/22.
//

import Foundation
import Domain

public protocol PostDetailLocalDataSourceInterface {
    func getCachedDetails(handler: @escaping (PostEntity) -> ())
}
