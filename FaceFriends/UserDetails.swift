//
//  UserDetails.swift
//  FaceFriends
//
//  Created by Uzay Toprak on 1.02.2022.
//

import SwiftUI

struct UserDetails: View {
    let users: [User]
    let chosenUser: User
    var body: some View {
        ScrollView {
            VStack {
                Text("About").font(.title).padding(.bottom)
                HStack {
                    Text(chosenUser.about)
                }
                .padding(.horizontal)
                
                Divider()
                Text("Info").font(.title).padding(.bottom)
                VStack(alignment: .leading) {
                    Text("E-Mail: \(chosenUser.email)")
                    Text("Registered Date: \(chosenUser.registered)")
                    Text("Company: \(chosenUser.company)")
                    Text("Age: \(String(chosenUser.age))")
                }
                .padding(.horizontal)
                
                Divider()
                Text("Friends").font(.title).padding(.bottom)
                VStack {
                    ForEach(chosenUser.friends) { friend in
                        HStack {
                            Text(friend.name)
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle(chosenUser.name)
        }
    }
}
