# Swift Package Macro Import Warning Reproduction

This repository demonstrates a Swift compiler bug where a `package import` is incorrectly flagged as unused when the imported module is used via a macro attribute.

## The Bug

When a macro attribute (like `@Mocked`) from an external module is applied to a `package`-level declaration, the compiler incorrectly emits:

```
warning: package import of 'Mocking' was not used in package declarations
```

## To Reproduce

1. Clone this repository
2. Run `swift build`
3. Observe the warning:

```
/path/to/Sources/MacroImportWarningRepro/Example.swift:1:17: warning: package import of 'Mocking' was not used in package declarations
package import Mocking
               `- warning: package import of 'Mocking' was not used in package declarations
```

## The Code

```swift
package import Mocking
package import Foundation

@Mocked(compilationCondition: .none)
package protocol ExampleProtocol {
    var value: URL { get }
}
```

The `@Mocked` macro is clearly being used at the `package` access level (it's attached to a `package protocol`), but the compiler doesn't recognize this as a valid use of the `package import`.

## Expected Behavior

No warning should be emitted. The macro attribute usage should count as using the import at the package access level.

## Notes

- Changing `package` to `public` produces **no warning** (the `public` case works correctly due to exportability checking)
- The `@Mocked` macro is a peer macro that generates a mock class conforming to the protocol

## Related

- Swift Issue: https://github.com/swiftlang/swift/issues/86375
