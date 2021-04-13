//
//  SwiftUiImageView.swift
//  FedTrack
//
//  Created by Brianna Babcock on 3/9/21.
//
import SwiftUI
struct DividerView: View {
    var colorForView = Color("Grey")
    var body: some View {
        VStack {
            Divider()
                .frame(width: 50, height: 3, alignment: .center)
                .background(colorForView)
        }
    }
}
struct ContentView: View {
    var committee: Bool
    var house: Bool
    var senate: Bool
    var enacted: Bool
    var billName: String
    var isFavorited: Bool
    var billSubject: String
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
    var favoritedButton: Image {
        return isFavorited ? Image(systemName: "star.fill"): Image(systemName: "star")
    }
    var favoritedColor: Color {
        return isFavorited ? .yellow : .gray
    }
    var body: some View {
        HStack() {
            Spacer()
            VStack(alignment: .leading) {
                HStack {
                    Text(billName)
                        .font(Font.headline.weight(.bold))
    //                    .font(.headline)
                        .font(.system(size: 8))
                    Spacer()
                }
//                if billSubject == "" {
//                    Text("No Subject")
//                        .font(.system(size: 10))
//                }
                Text(billSubject)
//                    .fontWeight(.ultraLight)
                    .font(.system(size: 10))
                HStack(spacing: 0) {
                        Image(systemName: "c.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(comitteeButtonColor)
                    DividerView(colorForView: Color("Grey"))
                        Image(systemName: "house.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(houseButtonColor)
                    DividerView(colorForView: Color("Grey"))
                        Image(systemName: "person.2.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(senateButtonColor)
                    DividerView(colorForView: Color("Grey"))
                        Image(systemName: "pencil.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(enactedButtonColor)
                    Spacer()
                }
                .frame(height: 20)
            }
            favoritedButton
            .resizable()
            .foregroundColor(favoritedColor)
                .frame(width: 35, height: 35, alignment: .center)
            Spacer()
        }
        .padding(.top, 10)
        .padding(.bottom, 10)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(committee: true, house: true, senate: false, enacted: false, billName: "Bill Number HR", isFavorited: true, billSubject: "Education").previewLayout(.fixed(width: 768, height: 100))
    }
}
