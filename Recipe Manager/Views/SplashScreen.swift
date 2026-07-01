//
//  SplashScreen.swift
//  Recipe Manager
//
//  Created by Anjali Minakshi on 01/07/26.
//
import SwiftUI

struct SplashScreen: View {

    @State private var isActive = false

    var body: some View {

        if isActive {

            HomeView()

        } else {

            VStack {

                Image(systemName: "fork.knife.circle.fill")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.orange)

                Text("Recipe Manager")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Cook • Save • Enjoy")
                    .foregroundColor(.gray)

            }
            .onAppear {

                DispatchQueue.main.asyncAfter(deadline: .now() + 04) {

                    isActive = true

                }

            }

        }

    }
}

#Preview {
    SplashScreen()
}

