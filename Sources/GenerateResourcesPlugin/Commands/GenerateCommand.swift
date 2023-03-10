import Foundation
import ArgumentParser
import ProjectAutomation
import GenerateResourcesFramework

struct GenerateCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "generate-resources",
        abstract: "Generates resources for project based only on swiftgen.yml config."
    )
    
    @Option(
        name: .shortAndLong,
        help: "The path to the folder that contains the swiftgen.yml config file. If not specified, the current directory is used. It will exit if the config is not found.",
        completion: .directory
    )
    var configPath: String?
    
    @Flag(
        name: .shortAndLong,
        help: "Show debug information."
    )
    var debug = false
    
    func run() throws {
        let path = configPath ?? ""
        let _ = try SwiftGenResourcesGenerator(path: path, debug: debug)
    }
}
