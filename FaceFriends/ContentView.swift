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
                    VStack {
                        HStack {
                            Text(user.name)
                            Spacer()
                            Text(user.isActive ? "Online" : "Offline")
                                .foregroundColor(user.isActive ? .blue : .red)
                        }
                        
                    }
                }
            }
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
