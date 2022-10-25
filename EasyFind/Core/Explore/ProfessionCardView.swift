//
//  ExploreProfessionalCardView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 10/11/22.
//

struct Profession: Identifiable {
    var id: UUID = UUID()
    var title: String
    var imageName: Int
    var desscription: String = "Asphalt shingles are the cheapest to repair, and slate the most expensive."
}

import SwiftUI

struct ProfessionCardView: View {
    
    var profession: Profession
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Image("pic-\(profession.imageName)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(5)
                .frame(width: 250, height: 150)
            VStack(alignment: .leading, spacing: 5) {
                Text(profession.title)
                    .font(.title3)
                    .fontWeight(.medium)
                Text(profession.desscription)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
        }
        .frame(width: 280, height: 300)
        .padding(0)
    }
}

struct ProfessionCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProfessionCardView(profession: Profession(title: "Roofers", imageName: 1))
    }
}
