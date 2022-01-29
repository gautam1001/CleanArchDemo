//
//  PostRemoteDataSource.swift
//  Data
//
//  Created by Prashant Gautam on 27/01/22.
//

import Foundation
import Domain


public protocol PostRemoteDataSourceInterface {
    
    init(urlString: String, coder:JSONDecoder)
    
    func getPosts(handler: @escaping ([PostModel]) -> ())
}

public class PostRemoteDataSource: PostRemoteDataSourceInterface {
    
    let urlString: String
    let coder: JSONDecoder
    
    public required init(urlString: String, coder:JSONDecoder = JSONDecoder()) {
        self.urlString = urlString
        self.coder = coder
    }
    
    public func getPosts(handler: @escaping ([PostModel]) -> ()) {
        
        guard let url = URL(string: urlString) else {
            return handler([])
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, urlResponse, error) in
            guard let data = data else {
                return handler([])
            }
            do {
                guard let postModels = try self?.coder.decode( [PostModel].self, from: data) else {
                    return handler([])
                }
                handler(postModels)
            } catch {
                print("Error")
            }
        }
        task.resume()
    }
    
}
