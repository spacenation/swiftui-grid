## Grid

SwiftUI Grid view layout with auto-sizing items and flexible column count.

## Requirements

- Swift 5+
- iOS 13+
- macOS 10.15+

## Examples

### Simple grid
```swift
Grid(0...100) {
    Text("\($0)")
}
```

### Grid with minimum item width and fixed item height.
```swift
Grid(self.planets, minimumItemWidth: 320, spacing: 16) {
    PlanetView(planet: $0)
        .frame(height: 400)
        .onTapGesture {
            print("Selection:", $0)
        }
}
.edgesIgnoringSafeArea(.all)
```
