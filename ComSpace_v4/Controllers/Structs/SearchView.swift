//
//  SearchView.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 27.12.2021.
//

import SwiftUI

struct SearchView: View {
   public var exampleColor : Color = Color(red: 240/255, green: 240/255, blue: 240/255)
    public var animation: Namespace.ID
    
    @EnvironmentObject var homeData: HomeViewModel
    // activation of textfield with the help of focusstate
    @FocusState var startTF: Bool
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 20){
                Button{
                    withAnimation{
                        homeData.searchActivated = false
                    }
                    homeData.searchText = ""
                }
            label:{
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundColor(Color.black.opacity(0.7))
                
            }
                HStack(spacing: 15){
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    TextField("Search", text: $homeData.searchText)
                        .focused($startTF)
                        .textCase(.lowercase)
                        .disableAutocorrection(true)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                    Capsule().strokeBorder(Color(.primaryColor), lineWidth: 1.5 )
                )
                .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                .padding(.trailing,20)
            }
            .padding([.horizontal])
                .padding(.top)
                .padding(.bottom,10)
            
            
            // filter
          // showing progress is searching
            // else showing no results if not found the event
            if let events = homeData.searchedEvents{
                if events.isEmpty{
                    // no results found
                    VStack(spacing: 10){
                        Image("nf")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.top,60)
                        
                        Text("Not Found")
                            .font(.custom("Mulish-Regular", size: 20))
                        Text("Try a more generic search term or try looking for alternative events")
                            .font(.custom("Mulish-Regular", size: 16))
                            .foregroundColor(exampleColor)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 30)
                    }
                    .padding()
                }
                else{
                    ScrollView(.vertical, showsIndicators: false){
                        // staggered grid
                        VStack(spacing: 20){
                            Text("Found \(events.count) - results")
                                .font(.custom("Mulish-Regular", size: 24))
                                .padding(.vertical)
                            StaggeredGrid(columns: 2,spacing: 20, list: events){event in
                                //events view
                                EventCardView(event: event)
                            }
                        }
                        .padding()
                    }
                }
            }else{
                ProgressView()
                    .padding(.top, 30)
                    .opacity(homeData.searchText == "" ? 0 : 1)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            exampleColor
                .ignoresSafeArea()
        )
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                startTF = true
            }
        }
    }
    @ViewBuilder
    func EventCardView(event: Event)->some View{
        VStack(spacing: 10){
            Image(event.eventImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
//                .previewLayout(.sizeThatFits)
                .cornerRadius(20)
                .offset(y: -50)
                .padding(.bottom,-50)
            
            Text(event.title)
                .font((.custom("Mulish-Bold", size: 18)))
//                .fontWeight(.semibold)
                .padding(.top)
            Text(event.subtitle)
                .font((.custom("Mulish-Regular", size: 18)))
//                .padding(.top)
                .foregroundColor(.gray)
            Text(event.date)
                .font((.custom("Mulish-Bold", size: 16)))
//                .fontWeight(.semibold)
                .padding(.top,5)
                .foregroundColor(Color(.primaryColor))
        }
        .padding(.horizontal,20)
        .padding(.bottom,22)
        
        .background(
            Color.white.cornerRadius(20)
        )
//        .padding(.top, 80)
        .padding(.top,50)
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
            Home()
//        SearchView(animation: animation)
//            .environmentObject(HomeViewModel())
        
    }
}
