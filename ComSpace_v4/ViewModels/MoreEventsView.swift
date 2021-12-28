//
//  MoreEventsView.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 27.12.2021.
//

import SwiftUI

struct MoreEventsView: View {
    
    @StateObject var homeData: HomeViewModel = HomeViewModel()
    let exampleColor : Color = Color(red: 240/255, green: 240/255, blue: 240/255)
    
    var body: some View {
  
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 15){
                Text("More Events")
                    .font(.custom("Mulish-Bold", size: 18))
                    .foregroundColor(.black)
                    .frame(width: .infinity, alignment: .leading)
                ForEach(homeData.filteredEvents){event in
                    // Events Card View
                    EventCardView(event: event)
                }
            }
            .padding(.vertical,25)
            .padding(.bottom)
            .padding(.top, 40)
            
        }.background(exampleColor).ignoresSafeArea()
    }
    @ViewBuilder
    func EventCardView(event: Event)->some View{
        VStack(spacing: 10){
            Image(event.eventImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: getRec().width / 2.5)
//                .previewLayout(.sizeThatFits)
                .cornerRadius(20)
                .padding(.top, 15)
//                .offset(y: -80)
//                .padding(.bottom,-80)
            
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
                .frame(width: 330, height: 300)
        )
        .frame(width: 400, height: 300)
        .padding(.top, 10)
    }
}

struct MoreEventsView_Previews: PreviewProvider {
    static var previews: some View {
        MoreEventsView()
    }
}
