//
//  NetworkManager.swift
//  StartiOS-HW16-Rustem Usserov
//
//  Created by Rustem on 10.05.2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    func getData(urlRequest: String) {
        guard let url = URL(string: urlRequest) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse else {
                    print("Failed to get HTTP response")
                    return
                }

                print("Response status code: \(httpResponse.statusCode)")

                guard httpResponse.statusCode == 200, let data = data else {
                    print("Server responded with status code: \(httpResponse.statusCode)")
                    return
                }

                do {
                    let decodedData = try JSONDecoder().decode(CardResponse.self, from: data)
                    for card in decodedData.cards {
                        print("Имя карты: \(card.name)")
                        print("Тип: \(card.type)")
                        print("Мановая стоимость: \(card.manaCost)")
                        print("Название сета: \(card.setName)")
                        print("-------")
                    }
                } catch {
                    print("Failed to decode JSON: \(error)")
                }
            }
        }.resume()
    }
}
