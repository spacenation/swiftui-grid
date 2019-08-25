import SwiftUI

/// Fixed columns `Grid` style.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct FixedColumnsGridStyle: GridStyle {
    public var padding = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    
    private let columns: Int
    private let itemHeight: CGFloat
    private let hSpacing: CGFloat
    private let vSpacing: CGFloat
    
    public init(columns: Int, itemHeight: CGFloat, spacing: CGFloat = 8) {
        self.columns = columns
        self.itemHeight = itemHeight
        self.vSpacing = spacing
        self.hSpacing = spacing
    }
    
    public init(columns: Int, itemHeight: CGFloat, hSpacing: CGFloat = 8, vSpacing: CGFloat = 8) {
        self.columns = columns
        self.itemHeight = itemHeight
        self.hSpacing = hSpacing
        self.vSpacing = vSpacing
    }
    
    public func frameHeight(at index: Int, with geometry: GeometryProxy, itemsCount: Int) -> CGFloat? {
        self.itemHeight
    }
    public func frameWidth(at index: Int, with geometry: GeometryProxy, itemsCount: Int) -> CGFloat? {
        self.itemWidth(for: geometry, columns: self.columns, padding: self.padding, hSpacing: self.hSpacing)
    }
    
    public func position(at index: Int, with geometry: GeometryProxy, itemsCount: Int) -> CGPoint {
        self.position(
            at: index,
            with: geometry,
            columns: self.columns,
            itemHeight: self.itemHeight,
            padding: self.padding,
            hSpacing: self.hSpacing,
            vSpacing: self.vSpacing
        )
    }
    
    public func gridHeight(with geometry: GeometryProxy, itemsCount: Int) -> CGFloat {
        self.gridHeight(
            with: geometry,
            itemsCount: itemsCount,
            columns: self.columns,
            itemHeight: self.itemHeight,
            padding: self.padding,
            hSpacing: self.hSpacing,
            vSpacing: self.vSpacing
        )
    }
    
    @inlinable func availableWidth(with geometry: GeometryProxy, padding: EdgeInsets, hSpacing: CGFloat) -> CGFloat {
        let horizontalPadding = padding.leading + padding.trailing
        return geometry.size.width - horizontalPadding
    }
    
    @inlinable func position(at index: Int, with geometry: GeometryProxy, columns: Int, itemHeight: CGFloat, padding: EdgeInsets, hSpacing: CGFloat, vSpacing: CGFloat) -> CGPoint {
        let row = index / max(1, columns)
        let itemIndexAtRow = index % max(1, columns)
        let itemWidth = self.itemWidth(for: geometry, columns: columns, padding: padding, hSpacing: hSpacing)
        let hSpacingForItem = CGFloat(itemIndexAtRow) * hSpacing
        let x = ((itemWidth / 2) + CGFloat(itemIndexAtRow) * itemWidth) + padding.leading + hSpacingForItem
        let y = ((itemHeight / 2) + CGFloat(row) * itemHeight) + padding.top + (CGFloat(row) * vSpacing)
        return CGPoint(x: x, y: y)
    }
    
    @inlinable func itemWidth(for geometry: GeometryProxy, columns: Int, padding: EdgeInsets, hSpacing: CGFloat) -> CGFloat {
        let availableWidth = self.availableWidth(with: geometry, padding: padding, hSpacing: hSpacing)
        let usableWidth = availableWidth - (CGFloat(columns - 1) * hSpacing)
        return usableWidth / CGFloat(columns)
    }
    
    @inlinable func gridHeight(with geometry: GeometryProxy, itemsCount: Int, columns: Int, itemHeight: CGFloat, padding: EdgeInsets, hSpacing: CGFloat, vSpacing: CGFloat) -> CGFloat {
        let rowCount = Int((CGFloat(itemsCount) / max(1.0, CGFloat(columns))).rounded(.up))
        let verticalPadding = padding.top + padding.bottom
        return CGFloat(rowCount) * itemHeight + verticalPadding + (CGFloat(rowCount - 1) * vSpacing)
    }
}
