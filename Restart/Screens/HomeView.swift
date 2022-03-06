//
//  HomeView.swift
//  Restart
//  https://credo.academy
//  Created by Camelia Braghes on 23.02.2022.
//

import SwiftUI

struct HomeView: View {
    
    // MARK:  PROPERTY
    
    ///this property will set up a new onboarding key and app storage.
    @AppStorage("onBoarding") var isOnBoardingViewActive: Bool = false
    @State private var isAnimating: Bool = false

    // MARK:  BOBY

    var body: some View {
        VStack(spacing: 20) {
            
            // MARK:  HEADER
            Spacer()
            
            ZStack{
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
               
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        .easeOut(duration: 4)
                        .repeatForever()
                      , value: isAnimating
                    )
                }
            
            // MARK:  CENTER
            
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            //MARK:  FOOTER
            
            Spacer()
            
            Button(action: {
                withAnimation {
                playSound(sound: "success", type: "m4a")
                isOnBoardingViewActive = true
            }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.regular)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { isAnimating = true
            }
        }
    }
}
// MARK:  PREVIEW

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
