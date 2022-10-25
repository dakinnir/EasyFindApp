//
//  CalendarView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 10/19/22.
//

import SwiftUI

struct CalendarView: View {
    
    @State var showAddTodoView: Bool = false
    
    var body: some View {
        VStack {
            Text("Calendar View Tab")
        }
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showAddTodoView, content: {
            AddTodoView()
        })
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showAddTodoView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
