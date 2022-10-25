//
//  MessagesView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 10/25/22.
//

import SwiftUI

struct MessagesView: View {
    var body: some View {
        VStack {
            Text("Messages Tab")
        }
        .navigationBarTitleDisplayMode(.inline)

        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // showAddView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                
            }
            
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
