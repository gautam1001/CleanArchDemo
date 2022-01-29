//
//  PostDetailsVM.swift
//  Presentation
//
//  Created by Prashant Gautam on 28/01/22.
//

import Foundation
import Domain

public class PostDetailsVM: ObservableObject {
    
    @Published var details: PostEntity?
    var postId: Int?
    var detailInteractor:PostDetailInteractorInterface
    
    public init(interactor:PostDetailInteractorInterface) {
        
        self.detailInteractor = interactor
    }
    
    func getDetails() {
        
        self.detailInteractor.getPostDetails { [weak self] postEntity in
            self?.details = postEntity
        }
    }
    
}
