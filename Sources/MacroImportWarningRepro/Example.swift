package import Mocking
package import Foundation

@Mocked(compilationCondition: .none)
package protocol ExampleProtocol {
    var value: URL { get }
}
