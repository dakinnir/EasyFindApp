//
//  BasicRowView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 10/12/22.
//

import SwiftUI

struct BasicRowView: View {
    
    var profession: Profession
    
    var body: some View {
        HStack {
            Image("pic-\(profession.imageName)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)

                .frame(width: 70, height: 70)
            Text(profession.title)
                .font(.headline)
                .fontWeight(.medium)
            Spacer()
        }
        .padding(0)
    }
}

struct BasicRowView_Previews: PreviewProvider {
    static var previews: some View {
        BasicRowView(profession: Profession(title: "Home Cleaners", imageName: 1))
    }
}
