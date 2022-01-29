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
    @State private var selectedPostId:Int? 
    @ObservedObject var postVM: PostViewModel
    
    @State var detailsIsPresented: Bool = false
    
    public init(appDI: AppDIInterface, postVM:PostViewModel) {
        self.postVM = postVM
        self.appDI = appDI
    }
    
    public var body: some View {
        NavigationView {
            List(postVM.posts) { post in
                    VStack {
                        Text(post.title ?? "")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                        
                        Text(post.body )
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                .onTapGesture {
                    self.detailsIsPresented = true
                    self.selectedPostId = post.id
                }
            }
            .sheet(isPresented: $detailsIsPresented, content: {
                if let id = self.selectedPostId {
                    let detailVM = self.appDI.postDetailsDependencies(postId: id)
                    PostDetailsView(appDI: self.appDI, postDetailsVM: detailVM)
                }
            })
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
