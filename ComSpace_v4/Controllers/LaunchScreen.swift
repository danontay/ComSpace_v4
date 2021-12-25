//
//  LaunchScreen.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 25.12.2021.
//

import SwiftUI
import UIKit

struct LaunchScreen: View {
    @State var showLoginPage: Bool = false
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "MainLogoSvg")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Image("whitelogo")
                VStack{
                    Text("ComSpace")
                        .font(.custom("Mulish-Bold", size: 40))
                        .foregroundColor(.white)
                    Text("community space")
                        .font(.custom("Mulish-Regular", size: 20))
                        .foregroundColor(.white)
                }
            }
            Spacer()
            Text("Networking is around you!")
                .font(.custom("Mulish-Bold", size: 20))
                .foregroundColor(.white)
            Text("Create your own community")
                .font(.custom("Mulish-Bold", size: 16))
                .foregroundColor(.white)
            Button{
                showLoginPage = true
            }
        label: {
                Text("Get Started")
                .font(.custom("Mulish-Bold", size: 18))
                .padding(.vertical, 18)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(20)
                .foregroundColor(Color(.primaryColor))
            }
                .padding(.horizontal,30)
                .padding(.vertical, 20)
                .offset(y: getRec().height < 750 ? 0 : 10)
        }
        .padding(.top,getRec().height < 750 ? 10 : 30)

        .background(
        Image("launchScreen")
        )
    }
    public func check() -> Bool{
        return showLoginPage
    }
    
}
struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
            .previewDevice("iPhone 13")
//        LaunchScreen()
//            .previewDevice("iPhone 8")
    }
}
extension View{
    func getRec()-> CGRect{
        return UIScreen.main.bounds
    }
}
