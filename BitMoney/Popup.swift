//
//  Popup.swift
//  BitMoney
//
//  Created by Hadi Chaaban on 2/13/23.
//

import Foundation
import SwiftUI

struct Popup: View {
    var body: some View {
        GeometryReader { geo in
            ZStack{
                Rectangle()
                    .ignoresSafeArea(.all)
                    .opacity(0.5)
                
                Image("Smallpopup")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width * 0.95)
                
                    .overlay(
                        
                        VStack{
                            HStack{
                                Text("Status")
                                    .font(Font.custom("PressStartK", size: geo.size.width * 0.08))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .top)
                                    .padding(geo.size.width * 0.07)
                            }
                            Text("You are feeling \("hungry").")
                                .font(Font.custom("PressStartK", size: geo.size.width * 0.07))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .top)
                                .padding(geo.size.width * 0.02)
                            Spacer()
                        }
                    )
            }
        }
    }
}


struct Popup_Previews: PreviewProvider {
    static var previews: some View {
        Popup()
    }
}
