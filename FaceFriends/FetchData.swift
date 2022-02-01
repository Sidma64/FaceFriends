//
//  FetchData.swift
//  FaceFriends
//
//  Created by Uzay Toprak on 31.01.2022.
//

import Foundation

func loadData() async {
    guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
        print("Invalid URL")
        return
    }
    
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        if let decodedResponse = try? JSONDecoder().decode(User.self, from: data) {
            results = decodedResponse.results
        }
    } catch {
        print("Invalid data")
    }
    
}
