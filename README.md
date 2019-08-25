## SwiftUI Grid

SwiftUI Grid view layout with auto-sizing items and flexible column count.

<center>
<img src="Resources/iPad1.png"/>
</center>

## GridStyles

Open `/Examples/GridExamples.xcodeproj` for more examples for both iOS and macOS


### AutoColumnsGridStyle (Default)

```swift
Grid(0...100) { _ in
    Rectangle()
        .foregroundColor(.blue)
}
```

```
Grid(0...100) { _ in
    Rectangle()
        .foregroundColor(.red)
}
.gridStyle(
    AutoColumnsGridStyle(minItemWidth: 160, itemHeight: 80, hSpacing: 8, vSpacing: 8)
)
```
### FixedColumnsGridStyle

```swift

Grid(0...100) { number in
    Card(title: "\(number)")
}
.gridStyle(
    FixedColumnsGridStyle(columns: 3, itemHeight: 160)
)
```
### SingleColumnGridStyle

```swift
Grid(0...100) { number in
    Card(title: "\(number)")
}
.gridStyle(
    SingleColumnGridStyle(itemHeight: 160)
)
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
