//
//  ExploreView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 10/11/22.
//

import SwiftUI

enum ExplorePageSection: String, CaseIterable {
    case forYourHome = "For your home"
    case professionals = "Professionals near you"
    case essentialsHomeServices = "Essential home services"
    case popular = "Popular"
    
    var description: String {
        return self.rawValue.capitalized
    }
}


struct ExploreView: View {
    
    // MARK: - Properties
    @State var showAddView: Bool = false
    
    @State private var userQuery: String = ""
    @State var professions: [Profession] = [
        Profession(title: "Roofers", imageName: 1),
        Profession(title: "Painter", imageName: 2),
        Profession(title: "Carpentar", imageName: 3),
        Profession(title: "House Cleaners", imageName: 4),
        Profession(title: "Electrician", imageName: 5, desscription: "You should use a the VStack inside a ScrollView for the vertical one; and a HStack inside a ScrollView for the horizontal one.")
    ].shuffled()
    
    var professionals = [
        Professional(title: "Moonlit Media | Logos", rating: 4, pricing: 165, imageName: 1),
        Professional(title: "Peter Logos", rating: 5, pricing: 120, imageName: 6),
        Professional(title: "James Plumbing", rating: 4, pricing: 100, imageName: 7),
        Professional(title: "Jim Harbaugh Team Painting", rating: 2, pricing: 214, imageName: 4)
    ]
    
    let rows: [GridItem] = [
        GridItem(.fixed(280), spacing: 20, alignment: .leading),
    ]
    
    let professionalRows: [GridItem] = [
        GridItem(.fixed(200), spacing: 5, alignment: .leading),
    ]
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 0, alignment: .leading),
    ]
    
    let sections: [ExplorePageSection] = ExplorePageSection.allCases
    
    var body: some View {
        VStack {
            SearchBarView(text: $userQuery, searchBarPlaceholderText: "Search for professionals near you...")
                .padding(.horizontal)
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(sections, id: \.self) { section in
                        HStack {
                            Text(section.description)
                                .font(.title2)
                                .fontWeight(.medium)
                                .foregroundColor(.mainColor)
                            Spacer()
                        }
                        .padding(.horizontal)
                        if section == .popular {
                            ScrollView(.vertical, showsIndicators: false) {
                                LazyVGrid(columns: columns, spacing: 0) {
                                    ForEach(professions) { profession in
                                        NavigationLink {
                                            Text(profession.title)
                                        } label: {
                                            BasicRowView(profession: profession)
                                                .padding(.horizontal)
                                        }                                 .buttonStyle(PlainButtonStyle())
                                    }
                                }
                            }
                        } else if section == .professionals {
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHGrid(rows: professionalRows, spacing: 0) {
                                    ForEach(professionals) { professional in
                                        NavigationLink {
                                            Text(professional.title)
                                        } label: {
                                            ProfessionalCardView(professional: professional)
                                                .padding(.horizontal)
                                        }                                            .buttonStyle(PlainButtonStyle())
                                    }
                                }
                                .padding(.bottom, 20)
                                
                            }
                        } else {
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHGrid(rows: rows, spacing: 10) {
                                    ForEach(professions) { profession in
                                        NavigationLink {
                                            Text(profession.title)
                                        } label: {
                                            ProfessionCardView(profession: profession)
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                                .padding(.horizontal)
                                
                            }
                        }
                    }
                }
            }
        }
        .onTapGesture {
            self.hideKeyboard()
        }
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showAddView, content: {
            NewPage()
        })
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showAddView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}



struct NewPage: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Form {
                Text("Hello....")
            }
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Cancel") 
            }
            
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
