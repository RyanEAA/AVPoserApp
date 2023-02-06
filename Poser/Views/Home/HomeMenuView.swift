//
//  HomeMenuView.swift
//  Poser
//
//  Created by Ryan Aparicio on 1/31/23.
//

import SwiftUI

struct HomeMenuView: View {
    var body: some View {
        NavigationLink{
            CategoriesView()
            //PromptGeneratorView()
        } label: {
            Text("Hey there")
        }

    }
}

struct HomeMenuView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMenuView()
    }
}
