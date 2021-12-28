//
//  Home.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 27.12.2021.
//

import SwiftUI

struct Home: View {
    @State var exampleColor : Color = Color(red: 240/255, green: 240/255, blue: 240/255)
    @EnvironmentObject var sharedData: SharedDataModel
    @StateObject var homeData: HomeViewModel = HomeViewModel()
    @Namespace var animation
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(spacing:15){
                // Search Bar
                ZStack{
                    if homeData.searchActivated{
                        SearchBar()
                    }
                    else{
                        SearchBar()
                            .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                    }
                } 
                .frame(width: getRec().width / 1.6)
                .padding(.horizontal,25)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeInOut){
                        homeData.searchActivated = true
                    }
                }
                
                Text("Explore events")
                    .font(.custom("Mulish-Bold", size: 18))
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal,25)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 18){
                        ForEach(EventType.allCases, id: \.self){type in
                        EventTypeView(type: type)
                        }
                    }
                    .padding(.horizontal, 25)
                }
                .padding(.top, 25)
                
                //events page
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 25){
                        ForEach(homeData.filteredEvents){event in
                            // Events Card View
                            EventCardView(event: event)
                        }
                    }
                    .padding(.horizontal,25)
                    .padding(.bottom)
                    .padding(.top, 40)
                }
                .padding(.top,30)
                Button{
                    homeData.showMoreEventsOnType.toggle()
                }
                label:{
                    Label{
                        Image(systemName: "arrow.right")
                    } icon: {
                        Text("See more")
                    }
                    .font(.custom("Mulish-Bold", size: 15))
                    .foregroundColor(Color(.primaryColor))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                .padding(.trailing)
                .padding(.top,10)
            }
            .padding(.vertical)
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(exampleColor).ignoresSafeArea()
        .onChange(of: homeData.eventType){newValue in
            homeData.filterEventsByType()
              
        }
        .sheet(isPresented: $homeData.showMoreEventsOnType){
            
        } content:{
            MoreEventsView()
        }
        .overlay(
            ZStack{
                if homeData.showMoreEventsOnType{
                    MoreEventsView()
                        .environmentObject(homeData)
                }
            }
        )
        .overlay(
            ZStack{
                if homeData.searchActivated{
                    SearchView(animation: animation)
                        .environmentObject(homeData)
                }
            }
        )
    }

    @ViewBuilder
    func EventCardView(event: Event)->some View{
        VStack(spacing: 10){
            Image(event.eventImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: getRec().width / 2.5, height: getRec().width / 2.5)
//                .previewLayout(.sizeThatFits)
                .cornerRadius(20)
                .offset(y: -80)
                .padding(.bottom,-80)
            
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
        .onTapGesture {
            withAnimation(.easeInOut){
                sharedData.detailEvent = event
                sharedData.showDetailEvent = true
            }
        }
        .padding(.top, 80)
    }
    @ViewBuilder
    func SearchBar()->some View{
        HStack(spacing: 15){
            Image(systemName: "magnifyingglass")
                .font(.title2)
                .foregroundColor(.gray)
            
            TextField("Search", text: .constant(""))
                .disabled(true)
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .background(
            Capsule().strokeBorder(Color.gray, lineWidth: 0.8 )
        )
//        .frame(width: getRec().width / 1.6)
//        .padding(.horizontal,25)
    }
    
    @ViewBuilder
    func EventTypeView(type: EventType) -> some View{
        Button{
            withAnimation{
                homeData.eventType  = type
            }
        }label: {
            Text(type.rawValue)
                .font(.custom("Mulish-Bold", size: 15))
                .fontWeight(.semibold )
                .foregroundColor(homeData.eventType == type ? Color(.primaryColor) : Color.gray)
                .padding(.bottom, 10)
            
                .overlay(
                    ZStack{ if homeData.eventType == type{
                        Capsule()
                            .fill(Color(.primaryColor))
                            .frame(height: 2)
                    }
                        
                    }
                        .padding(.horizontal, -5)
                    , alignment: .bottom
                )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
//       MainPage()
        Home()
    }
}

 
