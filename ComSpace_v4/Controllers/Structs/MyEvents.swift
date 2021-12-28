import SwiftUI

// Since both of the views are mostly identical....
struct MyEvents: View {
    @EnvironmentObject var sharedData: SharedDataModel
    
    // Delete Option...
    @State var showDeleteOption: Bool = false
    
    var body: some View {
        
        NavigationView{
            
            VStack(spacing: 10){
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack{
                        
                        HStack{
                            
                            Text("Basket")
                                .font(.custom("Mulish-Bold", size: 28).bold())
                            
                            Spacer()
                            
                            Button {
                                withAnimation{
                                    showDeleteOption.toggle()
                                }
                            } label: {
                                Image("Delete")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                            }
                            .opacity(sharedData.cartEvents.isEmpty ? 0 : 1)

                        }
                        
                        // checking if liked products are empty...
                        if sharedData.cartEvents.isEmpty{
                            
                            Group{
                                Image("NoBasket")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                                    .padding(.top,35)
                                
                                Text("No Items added")
                                    .font(.custom("Mulish-Bold", size: 25))
                                    .fontWeight(.semibold)
                                
                                Text("Hit the plus button to save into basket.")
                                    .font(.custom("Mulish-Bold", size: 18))
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
                                ForEach($sharedData.cartEvents){$event in
                                    
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
                                        
                                        CardView(event: $event)
                                    }
                                }
                            }
                            .padding(.top,25)
                            .padding(.horizontal,10)
                        }
                    }
                    .padding()
                }
                
                // Showing Total and check out Button...
                if !sharedData.cartEvents.isEmpty{
                    
                    Group{
                        
                        HStack{
                            
//                            Text("Total")
//                                .font(.custom("Mulish-Bold", size: 14))
//                                .fontWeight(.semibold)
//                            
//                            Spacer()
//                            
//                            Text(sharedData.getTotalPrice())
//                                .font(.custom("Mulish_bold", size: 18).bold())
//                                .foregroundColor(Color("Purple"))
                        }
                        
                        Button {
                            
                        } label: {
                            
                            Text("Checkout")
                                .font(.custom("Mulish-Bold", size: 18).bold())
                                .foregroundColor(.white)
                                .padding(.vertical,18)
                                .frame(maxWidth: .infinity)
                                .background(Color("Purple"))
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                        }
                        .padding(.vertical)
                    }
                    .padding(.horizontal,25)
                }
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
            
                Color("HomeBG")
                    .ignoresSafeArea()
            )
        }
    }
    
    func deleteProduct(event: Event){
        
        if let index = sharedData.cartEvents.firstIndex(where: { currentProduct in
            return event.id == currentProduct.id
        }){
            
            let _ = withAnimation{
                // removing...
                sharedData.cartEvents.remove(at: index)
            }
        }
    }
}

struct CartPage_Previews: PreviewProvider {
    static var previews: some View {
        MyEvents()
    }
}

struct CardView: View{
    
    // Making Product as Binding so as to update in Real time...
    @Binding var event: Event
    
    var body: some View{
        
        HStack(spacing: 15){
            
            Image(event.eventImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text(event.title)
                    .font(.custom("Mulish-Bold", size: 18).bold())
                    .lineLimit(1)
                
                Text(event.date)
                    .font(.custom("Mulish-Bold", size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Purple"))
                
                // Quantity Buttons...
                HStack(spacing: 10){
                    
                    Text("Quantity")
                        .font(.custom("Mulish-Bold", size: 14))
                        .foregroundColor(.gray)
                    
                    Button {
                        event.place = (event.place > 0 ? (event.place - 1) : 0)
                    } label: {
                        Image(systemName: "minus")
                            .font(.caption)
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                            .background(Color("Quantity"))
                            .cornerRadius(4)
                    }

                    Text("\(event.place)")
                        .font(.custom("Mulish-Bold", size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Button {
                        event.place += 1
                    } label: {
                        Image(systemName: "plus")
                            .font(.caption)
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                            .background(Color("Quantity"))
                            .cornerRadius(4)
                    }
                }
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
}
