//
//  Home.swift
//  sgt
//
//  Created by Christian Riccio on 10/02/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack {
            Image("photo").scaledToFit().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            VStack {
//                LoginButtonVieW()
//                RegisterButtonView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
