import Foundation
import PathKit
import SwiftGenCLI
import ArgumentParser

public struct SwiftGenResourcesGenerator {
    
    public init(path: String = "", debug: Bool = false) throws {
        
        let logLevel: CommandLogLevel = debug ? .verbose : .`default`
        commandLogLevel = logLevel
        
        let file = Path(path + "swiftgen.yml")
        try validateExists(file: file)
        
        let configuration = try load(file: file)
        
        try file.parent().chdir {
            try configuration.runCommands(modernSpacing: true, logLevel: logLevel)
        }
    }
}

private func validateExists(file: Path) throws {
    if !file.isFile {
        throw ValidationError("`\(file)` is not found or not a YAML file")
    }
}

private func load(file: Path) throws -> Config {
    try .init(file: file)
}
