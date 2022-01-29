//
//  PostDetailsView.swift
//  Presentation
//
//  Created by Prashant Gautam on 28/01/22.
//

import SwiftUI

struct PostDetailsView: View {
    var appDI: AppDIInterface
    @ObservedObject public var postDetailsVM: PostDetailsVM
    
    public init(appDI: AppDIInterface, postDetailsVM: PostDetailsVM) {
        self.appDI = appDI
        self.postDetailsVM = postDetailsVM
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text(self.postDetailsVM.details?.title ?? "")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Text(self.postDetailsVM.details?.body ?? "" )
                    .font(.body)
                    .multilineTextAlignment(.center)
            }
        }
        .navigationTitle("Details")
        .onAppear {
            self.postDetailsVM.getDetails()
        }
    }
}

//struct PostDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostDetailsView(appDI: , postDetailsVM: <#T##PostDetailsVM#>)
//    }
//}
