//
//  Helper.swift
//  VWN-task
//
//  Created by wecancity on 16/04/2022.
//

import Foundation
import SwiftUI

struct InputTextField: View {
    @Binding var text: String
    var title : String
    let screenWidth = UIScreen.main.bounds.size.width - 50
    var body: some View {
        ZStack (alignment:.leading){
            if text != "" || !text.isEmpty{
                Text(title)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .offset(y: text.isEmpty ? 0 : -20)
                    .scaleEffect(text.isEmpty ? 1 : 0.9, anchor: .leading)
            }
            
            TextField(title,text:$text)
                .autocapitalization(.none)
                .textInputAutocapitalization(.none)
//                .padding(12)
                .font(.system(size: 20))

            
        }
        
//        .animation(.default)
        .frame(width: screenWidth, height: 45)
        .font(.system(size: 20))
        .padding(12)
        .disableAutocorrection(true)
        .background(
            Color.white
        ).foregroundColor(.black)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.099), radius: 3)
        
    }
}

struct InputTextField_Previews: PreviewProvider {
    static var previews: some View {
        InputTextField(text: .constant("text"), title: "Title")
    }
}


struct SecureInputView_Previews: PreviewProvider {
    static var previews: some View {
        SecureInputView("text", text: .constant("Title"))
    }
}


struct SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    let screenWidth = UIScreen.main.bounds.size.width - 50
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if isSecured {
             //   PasswordView(text: text, placeHolder: title)
                SecureField(title, text: $text)
                    .autocapitalization(.none)
//                    .animation(.default)
                    .frame(width: screenWidth, height: 45 , alignment: .trailing)
                    .font(.system(size: 20))
                    .padding(12)
                    .disableAutocorrection(true)
                    .background(
                        Color.white
                    ).foregroundColor(.black)
                        .cornerRadius(12)
                        .shadow(color: Color.gray.opacity(0.099), radius: 3)
            } else {
                TextField(title, text: $text)
                    .autocapitalization(.none)
//                    .animation(.default)
                    .frame(width: screenWidth, height: 45)
                    .font(.system(size: 20))
                    .padding(12)
                    .disableAutocorrection(true)
                    .background(
                        Color.white
                    ).foregroundColor(.black)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.099), radius: 3)
                
            }
            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
                    .padding()
            }
        }
    }
}




struct BackButtonView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var text:String
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Text(text)
//            Image(systemName: "chevron.backward")
//                .renderingMode(.original)
                .foregroundColor(.white)
                .padding()
                .font(.system(size: 22, weight: .bold))
                .background(
                    Rectangle()
                        .fill(LinearGradient(gradient:Gradient(colors: [Color.gray, Color.gray ]),startPoint: .center,endPoint: .trailing)
                              
                             )
                        .frame(width: 40, height: 40)
                        .cornerRadius(15)
                        .opacity(0.3)
                        .shadow(color: .white, radius: 3, x: 2, y: 2)
                )
        })
    }
}
