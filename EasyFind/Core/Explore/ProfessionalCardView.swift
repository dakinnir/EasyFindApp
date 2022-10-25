//
//  ProfessionalCardView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 10/12/22.
//

import SwiftUI

struct Professional: Identifiable {
    var id: UUID = UUID()
    var title: String
    var rating: Int
    var pricing: Int
    var imageName: Int
}


struct ProfessionalCardView: View {
    
    var professional: Professional
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.white)
                .shadow(radius: 5)
            VStack(alignment: .center, spacing: 5) {
                Image("pic-\(professional.imageName)")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(5)
                    Text(professional.title)
                        .fontWeight(.medium)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                HStack(spacing: 0) {
                    ForEach(0..<professional.rating) { _ in
                        Image(systemName: "star.fill")
                            .font(.subheadline)
                            .foregroundColor(.yellow)
                    }
                    .padding(.trailing, 3)
                    Text("(234)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            
                Text("$\(professional.pricing)-$230/Painting")
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
        }
        .frame(width: 180, height: 180)
        .padding(0)
    }
}

struct ProfessionalCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProfessionalCardView(professional: Professional(title: "Moonlit Media | Logos", rating: 4, pricing: 165, imageName: 1))
    }
}
