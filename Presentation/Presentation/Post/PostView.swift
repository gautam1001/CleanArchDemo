//
//  PostView.swift
//  Presentation
//
//  Created by Prashant Gautam on 27/01/22.
//

import SwiftUI
import Domain

public struct PostView: View {
    
    var appDI: AppDIInterface
    @ObservedObject var postVM: PostViewModel
    
    public init(appDI: AppDIInterface, postVM:PostViewModel) {
        self.postVM = postVM
        self.appDI = appDI
    }
    
    public var body: some View {
        NavigationView {
            List(postVM.posts) { post in
                NavigationLink {
                    let detailVM = self.appDI.postDetailsDependencies(postId: post.id ?? 0)
                    PostDetailsView(appDI: self.appDI, postDetailsVM: detailVM)
                } label: {
                    VStack {
                        Text(post.title ?? "")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                        
                        Text(post.body )
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                }

            }
            .navigationTitle("Posts")
        }
        .onAppear {
            self.postVM.getPosts()
        }
    }
}

//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostView(postVM: PostViewModel(postInteractor: PostInteractor())
//    }
//}
