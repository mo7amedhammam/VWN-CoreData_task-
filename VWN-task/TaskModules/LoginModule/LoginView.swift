//
//  LoginView.swift
//  VWN-task
//
//  Created by wecancity on 16/04/2022.
//

import SwiftUI

struct LoginView: View {
//    @FocusState private var isfocused : Bool

    @State var UserName = ""
    @State var Password = ""
    
    var body: some View {
        ZStack{
            VStack{
                
                
                Text("Hello Again!")
                    .multilineTextAlignment(.center)
                
                    .font(.system(size: 43))
                    .padding(.top,50)
                
                Text("Welcome back to your second home!")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 17))
                    .padding(.top,1)

                VStack {
                    InputTextField( text: UserName ,title: "UserName")
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    .textInputAutocapitalization(.never)
                
//                    .focused($isfocused)
                                       
                SecureInputView("Password", text: $Password)
                    .autocapitalization(.none)
                    .textInputAutocapitalization(.never)
//                    .focused($isfocused)
                }.padding()
                
                HStack{
                    Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Recover Password")
                        .foregroundColor(.black).opacity(0.8)
                })
                }.padding(.trailing,30)
                
                
                Button(action: {
                    // add review
                    if UserName == "admin" && Password == "admin"{
                        print("Success Login")
                    } else{
                        print("Wrong username or password")
                    }
                    
                }, label: {
                    HStack {
                        Text("Sign In")
                            .font(.system(size: 25))
//                            .fontWeight(.semibold)
//                            .font(.title3)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height:40)
                    .padding()
                    .background(.red).opacity(0.7)
                    .foregroundColor(.white).opacity(1.2)
    //                .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(12)
                    .padding(.horizontal, 20)
                }).padding(.top)

                
                HStack{
                    Text("Not a member?")
                        .foregroundColor(.black).opacity(0.8)
                Button(action: {
                    
                }, label: {
                    Text("Register now")
                        .foregroundColor(.black)
                        .bold()
                })
                }.padding()
                
                Spacer()
            }
            .frame(width:UIScreen.main.bounds.width)
    }
        .background(
            Image("BackgroundImg")
                .resizable()
        )
        
        .edgesIgnoringSafeArea(.all)
    
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
