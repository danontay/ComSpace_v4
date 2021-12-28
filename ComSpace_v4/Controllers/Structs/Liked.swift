//
//  Liked.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 28.12.2021.
//
import SwiftUI

struct Liked: View {
    var exampleColor : Color = Color(red: 240/255, green: 240/255, blue: 240/255)
    @EnvironmentObject var sharedData: SharedDataModel
    @StateObject var homeData: HomeViewModel = HomeViewModel()
    
    // Delete Option...
    @State var showDeleteOption: Bool = false
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    HStack{
                        Text("Favourites")
                            .font(.custom("Mulish_Bold", size: 28).bold())
                        Spacer()
                        
                        Button {
                            withAnimation{
                                showDeleteOption.toggle()
                            }
                        } label: {
                            Image(systemName: "trash.fill")
                                .foregroundColor(Color.black.opacity(0.7))
                                .imageScale(.large)
                        }
                        .opacity(sharedData.likedEvents.isEmpty ? 0 : 1)
                    }
                    // checking if liked products are empty...
                    if !sharedData.likedEvents.isEmpty{
                        
                        Group{
                            Image("NoLiked")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                                .padding(.top,35)
                            
                            Text("No favorites yet")
                                .font(.custom("Mulish-Bold", size: 25))
                                .fontWeight(.semibold)
                            
                            Text("Hit the like button on each product page to save favorite ones.")
                                .font(.custom("Mulish-bold", size: 18))
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                                .padding(.top,10)
                                .multilineTextAlignment(.center)
                        }
                    }
                    else{
                        // Displaying Products...
                        VStack(spacing: 15){
                            
                            // For Designing...
                            ForEach(homeData.events){event in
                                
                                HStack(spacing: 0){
                                    
                                    if showDeleteOption{
                                        Button {
                                            deleteProduct(event: event)
                                        } label: {
                                            Image(systemName: "minus.circle.fill")
                                                .font(.title2)
                                                .foregroundColor(.red)
                                        }
                                        .padding(.trailing)

                                    }
                                    
                                    CardView(event: event)
                                }
                            }
                        }
                        .padding(.top,25)
                        .padding(.horizontal)
                    }
                }
                .padding()
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
            exampleColor
                    .ignoresSafeArea()
            )
        }
    }
    
    @ViewBuilder
    func CardView(event: Event)->some View{
        
        HStack(spacing: 15){
            
            Image(event.eventImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text(event.title)
                    .font(.custom("Mulish-Bold", size: 18).bold())
                    .lineLimit(1)
                
                Text(event.subtitle)
                    .font(.custom("Mulish_bold", size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.primaryColor))
                
                Text("Type: \(event.type.rawValue)")
                    .font(.custom("Mulish-Bold", size: 13))
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal,10)
        .padding(.vertical,10)
        .frame(maxWidth: .infinity,alignment: .leading)
        .background(
        
            Color.white
                .cornerRadius(10)
        )
    }
    
    func deleteProduct(event: Event){
        
        if let index = sharedData.likedEvents.firstIndex(where: { currentProduct in
            return event.id == currentProduct.id
        }){
            
            let _ = withAnimation{
                // removing...
                sharedData.likedEvents.remove(at: index)
            }
        }
    }
}

struct LikedPage_Previews: PreviewProvider {
    static var previews: some View {
        Liked()
            .environmentObject(SharedDataModel())
//            .environmentObject(Home())
    }
}
