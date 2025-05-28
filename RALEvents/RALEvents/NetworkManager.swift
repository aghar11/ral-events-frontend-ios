import Foundation

class NetworkManager: ObservableObject {
    @Published var events: [Event] = []

    func fetchEvents() {
        guard let url = URL(string: "http://127.0.0.1:8000/events") else { return }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Network error:", error ?? "")
                return
            }

            do {
                let decoded = try decoder.decode([Event].self, from: data)
                DispatchQueue.main.async {
                    self.events = decoded
                }
            } catch {
                print("Decoding error:", error)
                if let str = String(data: data, encoding: .utf8) {
                    print("Raw JSON string:", str)
                }
            }
        }.resume()
    }
}
