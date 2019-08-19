## SwiftUI Grid

SwiftUI Grid view layout with auto-sizing items and flexible column count.

<center>
<img src="Resources/iPad1.png"/>
</center>

## Examples

Open `/Examples/GridExamples.xcodeproj` for more examples for both iOS and macOS

```swift
/// Simple grid.

Grid(0...100, minimumItemWidth: 100) { _ in
    Rectangle()
        .foregroundColor(.red)
        .frame(height: 100)
}
```

```swift
/// Grid with minimum item width and fixed item height.

Grid(self.planets, minimumItemWidth: 320, spacing: 16) {
    PlanetView(planet: $0)
        .frame(height: 400)
        .onTapGesture {
            print("Selection:", $0)
        }
}
```

## Performance

<center>
<img src="Resources/iPad2.png"/>
</center>

## Requirements

- Swift 5+
- iOS 13+
- macOS 10.15+

## Roadmap
- ZStack based grid instead of 'VStack of HStacks'
- Support for watchOS
- Items selection and rearranging
- UITests
- 'CSS Grid'-like features

## Contibutions
Feel free to contribute via fork/pull request to master branch. If you want to request a feature or report a bug please start a new issue.
