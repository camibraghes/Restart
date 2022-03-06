//
//  CircleGroupView.swift
//  Restart
//  https://credo.academy
//  Created by Camelia Braghes on 28.02.2022.
//

import SwiftUI

struct CircleGroupView: View {
    // MARK: PROPERTY
    
    ///property that represents the color of the attribute of the ring component.
    @State var ShapeColor: Color
    ///property that represents the opacity of the attribute of the ring component.
    @State var ShapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    // MARK: BODY
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
        .blur(radius: isAnimating ? 1 : 30)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5 )
        .animation(.easeOut(duration: 0.5), value: isAnimating)
        .onAppear {
            isAnimating = true
        }
        
    }
}

// MARK: PREVIEW

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}
