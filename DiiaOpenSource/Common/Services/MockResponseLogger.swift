import Foundation

enum MockResponseLogger {
    static func save<T: Encodable>(_ value: T, filename: String) {
        guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        guard let data = try? encoder.encode(value) else { return }
        let fileURL = dir.appendingPathComponent(filename)
        try? data.write(to: fileURL)
        print("[MockResponseLogger] Saved \(filename) to \(fileURL.path)")
    }
}
