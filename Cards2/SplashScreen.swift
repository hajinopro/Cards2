//
//  SplashScreen.swift
//  Cards2
//
//  Created by 하진호 on 2022/05/06.
//

import SwiftUI

private struct SplashAnimation: ViewModifier {
    @State private var animating = true
    let finalYPosition: CGFloat
    let delay: Double
    
    func body(content: Content) -> some View {
        content
            .offset(y: animating ? -700 : finalYPosition)
            .rotationEffect(animating ? .zero : Angle(degrees: Double.random(in: -10...10)))
            .animation(Animation.interpolatingSpring(mass: 0.2, stiffness: 80, damping: 5, initialVelocity: 0.0).delay(delay), value: animating)
            .onAppear {
                animating = false
            }
    }
}

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            card(letter: "S", color: "appColor1")
                .splashAnimation(finalYPosition: 240, delay: 0)
            card(letter: "D", color: "appColor2")
                .splashAnimation(finalYPosition: 120, delay: 0.2)
            card(letter: "R", color: "appColor3")
                .splashAnimation(finalYPosition: 0, delay: 0.4)
            card(letter: "A", color: "appColor6")
                .splashAnimation(finalYPosition: -120, delay: 0.6)
            card(letter: "C", color: "appColor7")
                .splashAnimation(finalYPosition: -240, delay: 0.8)
        }
    }
    
    func card(letter: String, color: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .shadow(radius: 3)
                .frame(width: 120, height: 160)
                .foregroundColor(.white)
            Text(letter)
                .fontWeight(.bold)
                .scalableText()
                .foregroundColor(Color(color))
                .frame(width: 80)
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

extension View {
    func splashAnimation(finalYPosition: CGFloat, delay: Double) -> some View {
        modifier(SplashAnimation(finalYPosition: finalYPosition, delay: delay))
    }
}
