//
//  SplashScreen.swift
//  BitMoney
//
//  Created by Hadi Chaaban on 2/21/23.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        GIFView(type: .name("flyingmoney"))
              .frame(maxHeight: 300)
              .padding()
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
