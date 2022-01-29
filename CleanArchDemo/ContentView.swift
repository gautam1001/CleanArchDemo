//
//  ContentView.swift
//  CleanArchDemo
//
//  Created by Prashant Gautam on 28/01/22.
//

import SwiftUI
import Presentation

struct ContentView: View {
    var body: some View {
//        Text("Hello, world!")
//            .padding()
        PostView(appDI: AppDI.shared, postVM: AppDI.shared.postDependencies())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
