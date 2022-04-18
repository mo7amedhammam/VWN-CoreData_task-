//
//  WelcomeView.swift
//  VWN-task
//
//  Created by wecancity on 16/04/2022.
//

import SwiftUI

struct WelcomeView: View {
    @State  var choices = ["Sign Up", "Log In"]
    @State  var choice = 0
    @State  var gotoLoginView = false
    @State  var gotoSignUpView = false

    var body: some View {
//        NavigationView {
            ZStack{
                VStack{
                    Image("WelcomeImg")
                        .resizable()
                        .padding(.top)

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
                    
                    
                  
//                    Button(action: {
//                        gotoLoginView = true
//                        print("Login here")
//                    }, label: {
//                        Text("\(choice)")
//                            .foregroundColor(.black)
//                            .bold()
//                    })
                    
                    Picker(selection: self.$choice, label: Text("Pick One")) {
                        
                        
                        ForEach(0 ..< self.choices.count) { option in
                                                  
                                                       Text(choices[option])
                                                           .font(.title)
                                                 
                                                       
                                               }
                    }
                                           .pickerStyle(SegmentedPickerStyle())
                                           .frame( width: (UIScreen.main.bounds.width/2)-20, height: 30)
                                           .scaledToFit()
                                           .scaleEffect(CGSize( width: 2.0, height: 2.0))
                                           .padding()
                    
                                           .onChange(of: choice) {newval in
                                               if newval == 1{
                                                   gotoLoginView = true
                                                   print("login again")
                                               }
                                           }
                                           
                    Spacer()
                }
                .padding(.horizontal)
                
                
                //            //  go to clinic info
                            NavigationLink(destination:LoginView(),isActive: $gotoLoginView) {
                                  }

            }
            .background(
                Image("BackgroundImg")
                    .resizable()
            )
            
        .edgesIgnoringSafeArea(.all)
   

//        }
        
      
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        WelcomeView()
    }
    }
}
