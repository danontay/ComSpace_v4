//
//  ProductDetailView.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 28.12.2021.
//

import SwiftUI

struct ProductDetailView: View {
    var animation: Namespace.ID
    public var exampleColor : Color = Color(red: 240/255, green: 240/255, blue: 240/255)
    var event: Event
    @EnvironmentObject var sharedData: SharedDataModel
    // Shared Data Model
    var body: some View {
        //
        VStack{
//        Text("something")
        VStack{
            HStack{
                Button{
                    withAnimation(.easeInOut){
                        sharedData.showDetailProduct = false
                    }
                }
            label:{
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundColor(Color.black.opacity(0.7))
            }
                Spacer()
                Button{
                    
                }
            label: {
                Image(systemName: "heart.fill")
                    .font(.title2)
                    .foregroundColor(Color.black.opacity(0.7))
                    .imageScale(.large)
            }
            }
            .padding()
            Image(event.eventImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "\(event.id)IMAGE", in:animation)
                .padding(.horizontal)
                .offset(y: -12)
                .cornerRadius(20)
                .frame(maxHeight: .infinity)
        }
        .frame( height: getRec().height/2.7)
        //
        ScrollView(.vertical, showsIndicators: false){
            // Product Data
            VStack(alignment: .leading, spacing: 15){
                Text(event.title)
                    .font(.custom("Mulish-Bold", size: 20))
                Text(event.subtitle)
                    .font(.custom("Mulish-Regular", size: 20))
                    .foregroundColor(.gray)
                Text(event.date)
                    .font(.custom("Mulish-Regular", size: 20))
                Text("Today")
                    .font(.custom("Mulish-Bold", size: 20))
                Text("Enjoy a fully integrated C/C++ development environment. Easily write and debug your code. Take your tech skills to the next level for 2 hours.")
                    .font(.custom("Mulish-Regular", size: 20))
                
                Button{
                    
                }
                label:{
                    Label{
                        Image(systemName: "arrow.right")
                           
                    }
                icon: {
                    Text("Full description")
                }
                .font(.custom("Mulish-Bold", size: 15))
                .foregroundColor(Color(.primaryColor))
                     
                }
                HStack{
                    Text("Places left")
                        .font(.custom("Mulish-Regular", size: 17))
                    Spacer()
                    Text("\(event.place)")
                        .font(.custom("Mulish-Bold", size: 20))
                        .foregroundColor(Color(.primaryColor))
                }
                .padding(.vertical,20)
                
                Button{
                    
                }
            label:{
                Text("Book the ticket")
                    .font(.custom("Mulish-Bold", size: 15))
                    .foregroundColor(.white)
                    .padding(.vertical,20)
                    .frame(maxWidth: .infinity)
                    .background(
                        Color(.primaryColor)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                    )
            }
            }
            .padding([.horizontal, .bottom], 20)
            .padding(.top, 25)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white
                        .cornerRadius(25)
                        .ignoresSafeArea()
        )
        
    }
        .background(exampleColor.ignoresSafeArea())
       
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
//        ProductDetailView(event:HomeViewModel().events[0])
//            .environmentObject(SharedDataModel())
        Home()
    }
}
