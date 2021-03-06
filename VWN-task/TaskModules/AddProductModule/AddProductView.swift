//
//  AddProductView.swift
//  VWN-task
//
//  Created by wecancity on 16/04/2022.
//

import SwiftUI
struct AddProductView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var meals = ["meal1", "meal2", "meal3", "meal4","meal5", "meal6"]
    @State var types = ["Type1", "Type2", "Type3", "Type4","Type5", "Type6"]
    @State var sheetTitle = 0
    @State var sheetsourse : [String] = []

    
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

    @State var showsheet = false
    @State var mustaddproduct = false


    @State var gotoalistproduct = false

    
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
                                                               
                                                ForEach(Imgarr, id:\.self){im in
                                                    Image(uiImage: im)
                                                        .resizable()
                                                        .foregroundColor(Color.black.opacity(0.6))
                                                        .font(.title)
                                                        .frame(width: 80, height: 80, alignment: .center)
                                                        .cornerRadius(12)
                                                    
                                                }
                                                
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
                                sheetTitle = 1
                                sheetsourse = meals
                                showsheet = true
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
                                sheetTitle = 2
                                sheetsourse = types
                                showsheet = true
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
//                                    HStack{
//                                        Spacer()
//                                        Image(systemName: "chevron.forward")
//                                            .padding(.trailing)
//            //                                .foregroundColor(Color("lightGray"))
//                                    }
                                }.padding(.horizontal )
                            
                            
                  
                        }

                            
        //                    .focused($isfocused)
                                               

                        
                        
                        Button(action: {
                            // add review
                        print(ProductName)
                            print(ProductInfo)
                            print(meal)
                            print(itemType)
                            print(price)
                            
                            if ProductName == "" || ProductInfo == "" || meal == "" || itemType == "" || price == "" || image.size.width <= 0{
                                mustaddproduct = true
                            } else {addItem(name: ProductName, info: ProductInfo, meal: meal, type: itemType, price: Double(price) ?? 0.0, image: image)
                            
                            gotoalistproduct = true
                            }
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
        
                if showsheet{
                    CustomSheet(IsPresented: $showsheet, content: {
                        Text( sheetTitle == 1 ? "choose meal":"choose ype" )
                        
                        ForEach(0..<sheetsourse.count , id:\.self) { ix in
                            Button(action: {
                                if sheetTitle == 1{
                                meal = sheetsourse[ix]
                                }  else{
                                    itemType = sheetsourse[ix]
                                }
                                self.showsheet = false
                            }, label:{
                                Text( "\(sheetsourse[ix])")
                                    .font(.title3)
                            })
                                .padding()
                        }
                    })
                }
                
            
            }    // alert with no ierror message
            .alert("add product info", isPresented: $mustaddproduct) {
            Button("OK", role: .cancel) {
//                    loginAgain.toggle()

            }
            }
            .onAppear(perform: {
                self.ProductName = ""
                self.ProductInfo = ""
                self.price = ""
                self.meal = ""
                self.itemType = ""
                
            })
            .background(
                Image("BackgroundImg")
                    .resizable()
            )
            .onChange(of: image){newim in
                Imgarr.append(newim)
            }
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
//        .navigationBarItems(leading: Button (action: {
//            self.presentationMode.wrappedValue.dismiss()
//
//        }, label: {
//            Text("Add Product")
//        }))
        
        //            //  go to clinic info
                    NavigationLink(destination:ListproductView(),isActive: $gotoalistproduct) {
                          }

    }
    
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.name, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
   private func addItem(name: String, info: String, meal: String, type: String,price:Double, image:UIImage) {
       withAnimation {
           let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
           newItem.name = name
           newItem.info = info
           newItem.meal = meal
           newItem.type = type
           newItem.price = price
           
//           newItem.image = image

//           if Imgarr.isEmpty == false {
//               let imageInput = imagearr(context: viewContext)
//               for img in Imgarr {
                 if let data = image.jpegData(compressionQuality: 0.5) {
//                   let imageInput = Item(context: viewContext)
                   newItem.image = data
//                   imageInput.defect = defectInput
                 }
//               }
//           }
           
           do {
               try viewContext.save()
           } catch {
               // Replace this implementation with code to handle the error appropriately.
               // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
               let nsError = error as NSError
               fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
           }
       }
   }

    func deleteItems(offsets: IndexSet) {
       withAnimation {
           offsets.map { items[$0] }.forEach(viewContext.delete)

           do {
               try viewContext.save()
           } catch {
               // Replace this implementation with code to handle the error appropriately.
               // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
               let nsError = error as NSError
               fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
           }
       }
   }

    
    
    
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}


struct myPicker: View {
   @Binding var sourceoptions: [String]

    var body: some View {
        HStack() {
            Spacer()
            Picker(selection: $sourceoptions, label: EmptyView()) {
                ForEach(0..<sourceoptions.count, id: \.self) { ix in
                    Button(action: {
                        
                    }, label:{
                        Text( sourceoptions[ix] ).tag(ix)
                    })
                }
                }.pickerStyle(WheelPickerStyle()).frame(width: 50).clipped().id(UUID().uuidString)
            
//            Picker(selection: seconds, label: EmptyView()) {
//                ForEach((0...59), id: \.self) { ix in
//                    Text("\(ix)").tag(ix)
//                }
//                }.pickerStyle(WheelPickerStyle()).frame(width: 50).clipped()
//            Text("Sec.")
            Spacer()
        }
    }
}



