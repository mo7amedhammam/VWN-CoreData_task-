//
//  WelcomeView.swift
//  VWN-task
//
//  Created by wecancity on 16/04/2022.
//

import SwiftUI

struct WelcomeView: View {
    @State private var choices = ["Sign Up", "Log In"]
        @State private var choice = 0
    
    var body: some View {
        ZStack{
            VStack{
                Image("WelcomeImg")
                    .resizable()
                    .padding(.top,20)

                    .aspectRatio( contentMode: .fit)
//                    .padding(.horizontal,20)
                
                Text("Discover Your\n Dream Job Here")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 43))
                    .padding(.top,50)
                
                Text("labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 17))
                    .padding(.top,1)

                Spacer()
                
                Picker(selection: self.$choice, label: Text("Pick One")) {
                    
                                           ForEach(0 ..< self.choices.count) {
                                               Text(self.choices[$0])
                                                   .font(.title)
                                                   
                                           }
                }
                                       .pickerStyle(SegmentedPickerStyle())
                                       .frame( width: (UIScreen.main.bounds.width/2)-20, height: 30)
                                       .scaledToFit()
                                       .scaleEffect(CGSize( width: 2.0, height: 2.0))
                                       .padding()
                                       

                Spacer()
            }
//            .background(.gray)
            .padding(.horizontal,20)
            
        }
        .background(
            Image("BackgroundImg")
                .resizable()
        )
        
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
