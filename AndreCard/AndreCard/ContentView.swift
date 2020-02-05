//
//  ContentView.swift
//  AndreCard
//
//  Created by André Brandão  on 05/02/2020.
//  Copyright © 2020 andrebp. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red:0.16, green:0.50, blue:0.73)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("0")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150.0, height: 150.0)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                Text("André Pinho")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                Divider()
                
                InfoView(text : "+351 91 919 19 91", imageName: "phone.fill")
                InfoView(text : "andrebpinho@protonmail.com", imageName: "envelope.fill")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

