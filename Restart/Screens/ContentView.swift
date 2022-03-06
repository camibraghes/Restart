//
//  ContentView.swift
//  Restart
//  https://credo.academy
//  Created by Camelia Braghes on 22.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    ///this property will set up a new onboarding key and app storage.
    @AppStorage("onBoarding") var isOnBoardingViewActive: Bool = true

    var body: some View {
        ZStack {
            if isOnBoardingViewActive {
                OnBoardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
