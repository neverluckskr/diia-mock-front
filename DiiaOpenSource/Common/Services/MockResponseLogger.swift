import Foundation

enum MockResponseLogger {
    static func saveData(_ data: Data, filename: String) {
        guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileURL = dir.appendingPathComponent(filename)
        try? data.write(to: fileURL)
        print("[MockResponseLogger] Saved \(filename) -> \(fileURL.path)")
    }
}
