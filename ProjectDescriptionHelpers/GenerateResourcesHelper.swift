import Foundation
let fileName = "swiftgen.yml"

public struct GenerateResourcesHelper {
    
    public init(debug: Bool = false) throws {
        let debug = debug ? " --debug" : ""
        let findResult = try safeShell("find . -name " + fileName)
        
        for path in filterPaths(from: findResult) {
            let result =  try safeShell("tuist generate-resources --configPath " + path + debug)
        }
    }
}

private func filterPaths(from findResult: String) -> [String] {
    let lines = findResult
        .replacingOccurrences(of: fileName, with: "")
        .split(whereSeparator: \.isNewline)
        .map { String($0) }
    return lines
}

@discardableResult
private func safeShell(_ command: String) throws -> String {
    let task = Process()
    let pipe = Pipe()
    
    task.standardOutput = pipe
    task.standardError = pipe
    task.arguments = ["-c", command]
    task.executableURL = URL(fileURLWithPath: "/bin/zsh")
    task.standardInput = nil
    
    try task.run()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)!
    
    return output
}
