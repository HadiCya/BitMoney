//
//  Popup.swift
//  BitMoney
//
//  Created by Hadi Chaaban on 2/13/23.
//

import Foundation
import SwiftUI

struct Popup: View {
    @Binding var showPopup: String
    var body: some View {
        GeometryReader { geo in
                Button(action: {
                    showPopup = ""
                    HapticManager.instance.impact(style: .soft)
                })
                {
                    ZStack{
                    Rectangle()
                        .ignoresSafeArea(.all)
                        .opacity(0.5)
                        .foregroundColor(.black)
                    
                    Image("Smallpopup")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.95)
                    
                        .overlay(
                            
                            VStack{
                                HStack{
                                    Text("Status")
                                        .multilineTextAlignment(.center)
                                        .font(Font.custom("PressStartK", size: 300))
                                         .foregroundColor(.black)
                                         .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.065)
                                         .minimumScaleFactor(0.01)
                                         .padding(geo.size.width * 0.05)
                                }
                                Text("\(showPopup)")
                                    .multilineTextAlignment(.center)
                                    .font(Font.custom("PressStartK", size: 300))
                                     .foregroundColor(.black)
                                     .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.05)
                                     .minimumScaleFactor(0.01)
                                     .padding(geo.size.width * 0.05)
                                Spacer()
                            }
                        )
                    }
                    
            }
        }
    }
}



//
//struct Popup_Previews: PreviewProvider {
//    static var previews: some View {
//        Popup()
//    }
//}
