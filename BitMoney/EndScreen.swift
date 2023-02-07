//
//  EndScreen.swift
//  BitMoney
//
//  Created by Haris Khan on 2/7/23.
//

import Foundation   
import SwiftUI

struct EndScreen: View {
@State private var isActive : Bool = false
    var body: some View {
        GeometryReader { geo in
            ZStack{
                    Text("End")
                            .font(Font.custom("PressStartK", size: geo.size.width * 0.08))
                            .foregroundColor(.black)
                            .padding(geo.size.width * 0.04)
                        
                }
        
        }
    }
}

struct EndScreen_Previews: PreviewProvider {
    static var previews: some View {
        EndScreen()
    }
}
