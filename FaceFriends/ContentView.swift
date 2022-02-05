//
//  ContentView.swift
//  FaceFriends
//
//  Created by Uzay Toprak on 31.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State var users = [User]()
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    NavigationLink(destination: UserDetails(users: users, chosenUser: user)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(user.name)
                                Text(user.email)
                                    .foregroundColor(.secondary)
                                    .font(.system(size: 12))
                            }
                                Spacer()
                                Text(user.isActive ? "Online" : "Offline")
                                    .foregroundColor(user.isActive ? .blue : .red)
                            
                        }
                    }
                }
            }
            .navigationTitle("FaceFriends")
            .task {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode([User].self, from: data)
            users = decodedResponse
        } catch let error as NSError {
            print("loadData() Error: \(error)")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
