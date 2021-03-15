//
//  SwiftUiImageView.swift
//  FedTrack
//
//  Created by Brianna Babcock on 3/9/21.
//

import SwiftUI

struct DividerView: View {
    var colorForView: Color = .blue
    
    var body: some View {
        VStack {
            Divider()
                .background(colorForView)
        }
    }
}

struct ContentView: View {
    
//    var bills = Bill
    
    let committee: Bool
    var house: Bool
    var senate: Bool
    var enacted: Bool
    
    var comitteeButtonColor: Color {
        return committee ? Color("NavyBlue") : Color("Grey")
    }
    var houseButtonColor: Color {
        return house ? Color("NavyBlue") : Color("Grey")
    }
    var senateButtonColor: Color {
        return senate ? Color("NavyBlue") : Color("Grey")
    }
    var enactedButtonColor: Color {
        return enacted ? Color("NavyBlue") : Color("Grey")
    }
    
    var body: some View {
        
        VStack {
            
//        HStack {
//            Text (bills.number)
//            Spacer()
//            Text (bills.shortTitle)
//            Spacer()
//            Button (Image(systemName: "star.fill"))
//        }
//            Spacer()
//
//            Text (bills.primarySubject)
            
//        Spacer()
            
        HStack(spacing: 0) {
                Image(systemName: "c.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(comitteeButtonColor)
            DividerView(colorForView: houseButtonColor)
                Image(systemName: "house.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(houseButtonColor)
            DividerView(colorForView: senateButtonColor)
                Image(systemName: "person.2.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(senateButtonColor)
            DividerView(colorForView: enactedButtonColor)
                Image(systemName: "pencil.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(enactedButtonColor)
        }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(committee: true, house: true, senate: true, enacted: false).previewLayout(.fixed(width: 768, height: 100))
    }
}
