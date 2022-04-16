//
//  AddProductView.swift
//  VWN-task
//
//  Created by wecancity on 16/04/2022.
//

import SwiftUI
struct AddProductView: View {
//    @FocusState private var isfocused : Bool
    var columns = Array(repeating: GridItem(.fixed(120), spacing: 8), count: 3)
    @State var showImageSheet = false
    @State private var startPicking = false
    @State private var imgsource = ""
    @State private var image = UIImage() // added
        
    @State private var Imgarr :[UIImage] = []

    @State var ProductName = ""
    @State var ProductInfo = ""
    @State var meal = ""
    @State var itemType = ""
    @State var price = ""


    @State var Password = ""
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView {
                    VStack{
                        Spacer().frame(height:150)
                        HStack{
                        Text("Add Product Images")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 17))
                            .padding(.top,1)
                        Spacer()
                        }.padding()
                        
                        ScrollView(showsIndicators: false) {
                                
                        
                                            LazyVGrid(columns: columns, spacing: 8) {
                                                Button(action: {

                                                    showImageSheet.toggle()


                                                }, label: {
                                                    Image(systemName: "plus")
                                                        .resizable()
                                                        .foregroundColor(Color.black.opacity(0.6))
                                                        .font(.title)
                                                        .frame(width: 24, height: 24, alignment: .center)
                                                })
                                                    .frame(width: 80, height: 80, alignment: .center)
                                                    .background(Color.white.opacity(0.5))
                                                    .cornerRadius(12)
                                                
        //                                        ForEach(Imgarr, id:\.self) { pho in
        //                                            ZStack(alignment: .topLeading ){
        ////                                            GalleryImgKingFisher(galleryObject: $pho )
        ////                                                .onTapGesture {
        //////                                                ispreviewImage = true
        //////                                                previewImageurl = URLs.BaseUrl + "\(pho.ImageUrl ?? "")"
        ////                                            }
        //
        ////                                                HStack(alignment: .lastTextBaseline){
        ////                                                    Spacer()
        ////                                                withAnimation(.easeInOut(duration: 2.0)){
        //////                                                    CircularButton(ButtonImage: Image(systemName: "trash"), forgroundColor: Color.white, backgroundColor: Color("subText").opacity(0.12), Buttonwidth: 15, Buttonheight: 15){
        ////                                                        print("delete image : \(pho.id ?? 464654646546)")
        //////                                                        idtoRemove = detail.id ?? 1212121212515151
        //////                                                        clinicGallery.startDeletingGallert(GalleryId: pho.id ?? 1212121212)
        ////                                                    }
        ////                                                }
        //                                            }
        //                                            }
        //                                        }
                                            
                                            }
                                      
                        }.padding(.horizontal,0)
                        
                        VStack {
                            InputTextField( text: $ProductName ,title: "Product Name")
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                            .textInputAutocapitalization(.never)
                        
                            InputTextField( text: $ProductInfo ,title: "Product Info")
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                            .textInputAutocapitalization(.never)

                            
        //                    ZStack(alignment: .leading){
        //                    HStack{
        //                        InputTextField( text: $ProductInfo ,title: "Product Info")
        //                            .keyboardType(.emailAddress)
        //                            .autocapitalization(.none)
        //                        .textInputAutocapitalization(.never)
        //
        //                    }
        //                        HStack{
        //                            Spacer()
        //                            Image(systemName: "chevron.forward")
        //                                .padding(.trailing)
        ////                                .foregroundColor(Color("lightGray"))
        //                        }
        //                    }
                            Button (action:{
                                
                            }, label: {
                                ZStack(alignment: .leading){
                                HStack{
                                    InputTextField( text: $meal ,title: "Meal")
                                        .keyboardType(.emailAddress)
                                        .autocapitalization(.none)
                                    .textInputAutocapitalization(.never)
                                    .disabled(true)

                                    
                                }
                                    HStack{
                                        Spacer()
                                        Image(systemName: "chevron.forward")
                                            .padding(.trailing)
            //                                .foregroundColor(Color("lightGray"))
                                    }
                                }
                            })   .padding(.horizontal)
                                .buttonStyle(.plain)

                            Button (action:{
                                
                            }, label: {
                                ZStack(alignment: .leading){
                                HStack{
                                    InputTextField( text: $itemType ,title: "Item Type")
                                        .keyboardType(.emailAddress)
                                        .autocapitalization(.none)
                                    .textInputAutocapitalization(.never)
                                    .disabled(true)
                                    
                                }
                                    HStack{
                                        Spacer()
                                        Image(systemName: "chevron.forward")
                                            .padding(.trailing)
            //                                .foregroundColor(Color("lightGray"))
                                    }
                                }
                            })   .padding(.horizontal)
                                .buttonStyle(.plain)

                         
                                ZStack(alignment: .leading){
                                HStack{
                                    InputTextField( text: $price ,title: "price")
                                        .keyboardType(.numberPad)
                                        .autocapitalization(.none)
                                    .textInputAutocapitalization(.never)

                                }
                                    HStack{
                                        Spacer()
                                        Image(systemName: "chevron.forward")
                                            .padding(.trailing)
            //                                .foregroundColor(Color("lightGray"))
                                    }
                                }.padding(.horizontal )
                            
                            
                  
                        }

                            
        //                    .focused($isfocused)
                                               

                        
                        
                        Button(action: {
                            // add review
                        
                            
                        }, label: {
                            HStack {
                                Text("Done")
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

                        
                       
                        
                        Spacer()
                    }
                    .frame(width:UIScreen.main.bounds.width)
                }
        }
            .background(
                Image("BackgroundImg")
                    .resizable()
            )
            
            .edgesIgnoringSafeArea(.all)
            
            //MARK: -------- imagePicker From Camera and Library ------
            .confirmationDialog("Choose Image From ?", isPresented: $showImageSheet) {
                Button("photo Library") { self.imgsource = "Library";   self.showImageSheet = false; self.startPicking = true }
                Button("Camera") {self.imgsource = "Cam" ;    self.showImageSheet = false; self.startPicking = true}
                Button("Cancel", role: .cancel) { }
            } message: {Text("Select Image From")}
            
            .sheet(isPresented: $startPicking) {
                if imgsource == "Library"{
                    // Pick an image from the photo library:
                    ImagePicker(sourceType: .photoLibrary, selectedImage: $image )
                }else{
                    //  If you wish to take a photo from camera instead:
                    ImagePicker(sourceType: .camera, selectedImage: $image)
                }
                
        }
        }
        .navigationTitle("add product")
        .navigationBarBackButtonHidden(true)
        
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
