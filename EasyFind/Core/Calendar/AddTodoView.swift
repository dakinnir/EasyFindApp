//
//  AddTodoView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 10/19/22.
//
class TodoViewModel: ObservableObject {
    @Published var topic: String = ""
    @Published var notes: String = ""
    @Published var startDate: Date = Date()
    @Published var additionalNotes: String = ""
    
}

import SwiftUI

struct AddTodoView: View {
    
    @ObservedObject var todoViewModel = TodoViewModel()
    @State var didStartEditing: Bool = false
    @State private var desiredHeight: CGFloat = 0

    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Topic", text: $todoViewModel.topic)
                    TextField("Notes", text: $todoViewModel.notes)
                }
                
                Section {
                    DatePicker("Begin", selection: $todoViewModel.startDate)
                    DatePicker("Complete by", selection: $todoViewModel.startDate)
                }
            
                Section {
                    TextView(text: $todoViewModel.additionalNotes, placeholderText: "Additional Notes", didStartEditing: $didStartEditing, desiredHeight: self.$desiredHeight)
                        .onTapGesture {
                            didStartEditing = true
                        }
                        .frame(height: max(self.desiredHeight, 200))

                }
                
            }
        }
        .navigationTitle("New Task")
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
