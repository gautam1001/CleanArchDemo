//
//  PostModel.swift
//  Data
//
//  Created by Prashant Gautam on 27/01/22.
//

import Foundation
import Domain

public struct PostModel: Codable {
    
    public let userId: Int?
    public let id: Int?
    public let title: String?
    public let body: String
    
    
    // DOT: Data Object Transfer
    public func dotPostEntity() -> PostEntity {
        return PostEntity(userId: userId, id: id, title: title, body: body)
    }
}
