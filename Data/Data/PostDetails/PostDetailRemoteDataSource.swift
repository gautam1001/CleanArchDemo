//
//  PostDetailRemoteDataSource.swift
//  Data
//
//  Created by Prashant Gautam on 28/01/22.
//

import Foundation
import Domain

public protocol PostDetailRemoteDataSourceInterface {
    
    init(urlString: String, coder:JSONDecoder)
    
    func getPostDetails(handler: @escaping (PostModel?) -> ())
}

public class PostDetailRemoteDataSource: PostDetailRemoteDataSourceInterface {
    
    let urlString:String
    let coder:JSONDecoder
    
    public required init(urlString: String, coder: JSONDecoder) {
        self.urlString = urlString
        self.coder = coder
    }
    
    public func getPostDetails(handler: @escaping (PostModel?) -> ()) {
        guard let url = URL(string: self.urlString) else {
            return handler(nil)
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, urlResponse, error) in
            guard let data = data else {
                return handler(nil)
            }
            do {
                guard let postModel = try self?.coder.decode( PostModel.self, from: data) else {
                    return handler(nil)
                }
                handler(postModel)
            } catch {
                print("Error")
            }
        }
        task.resume()
    }
}
