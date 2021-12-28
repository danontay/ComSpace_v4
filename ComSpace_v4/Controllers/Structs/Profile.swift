//


import SwiftUI

struct ProfilePage: View {
   var exampleColor : Color = Color(red: 240/255, green: 240/255, blue: 240/255)
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    Text("My Profile")
                        .font(.custom("Mulish-Bold", size: 28).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack(spacing: 15){
                        Image("app")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .offset(y: -30)
                            .padding(.bottom,-30)
                        
                        Text("Umurzakova Zarina")
                            .font(.custom("Mulish-Bold", size: 16))
                            .fontWeight(.semibold)
                        
                        HStack(alignment: .top, spacing: 10) {
                            
                            Image(systemName: "location.north.circle.fill")
                                .foregroundColor(.gray)
                                .rotationEffect(.init(degrees: 180))
                            
                            Text("Email: zaikaU@gmail.com")
                                .font(.custom("Mulish-Bold", size: 15))
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding([.horizontal,.bottom])
                    .background(
                    
                        Color(.primaryColor)
                            .cornerRadius(12)
                    )
                    .padding()
                    .padding(.top,40)
                    
                    // Custom Navigation Links...
                    
                    CustomNavigationLink(title: "Edit Profile") {
                        
                        Text("")
                            .navigationTitle("Edit Profile")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.gray
                                        .ignoresSafeArea())
                    }
                    
                    CustomNavigationLink(title: "Аddress") {
                        
                        Text("")
                            .navigationTitle("Edit address")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.gray .ignoresSafeArea())
                    }
                    
                    CustomNavigationLink(title: "Booking history") {
                        
                        Text("")
                            .navigationTitle("Booking history")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.gray .ignoresSafeArea())
                    }
                    
//                    CustomNavigationLink(title: "Cards") {
//                        Text("")
//                            .navigationTitle("Cards")
//                            .frame(maxWidth: .infinity, maxHeight: .infinity)
//                            .background(Color.gray .ignoresSafeArea())
//                    }
                    
                    CustomNavigationLink(title: "Notifications") {
                        
                        Text("")
                            .navigationTitle("Notifications")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background( Color.gray .ignoresSafeArea())
                    }
                }
                .padding(.horizontal,22)
                .padding(.vertical,20)
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
            exampleColor
                    .ignoresSafeArea()
            )
        }
    }
    
    // Avoiding new Structs...
    @ViewBuilder
    func CustomNavigationLink<Detail: View>(title: String,@ViewBuilder content: @escaping ()->Detail)->some View{
        
        
        NavigationLink {
            content()
        } label: {
            
            HStack{
                Text(title)
                    .font(.custom("Mulish-Bold", size: 17))
                    .fontWeight(.semibold)
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.black)
            .padding()
            .background(
            
                Color.white
                    .cornerRadius(12)
            )
            .padding(.horizontal)
            .padding(.top,10)
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
