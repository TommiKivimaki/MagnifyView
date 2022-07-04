// Copyright © 4.7.2022 Tommi Kivimäki.

import SwiftUI

@available(iOS 15, *)
public struct Magnifying: ViewModifier {

    private var size: CGSize
    private var minZoom: CGFloat = 1.0
    private var maxZoom: CGFloat = 3.0
    private var showsIndicators = false

    @State private var magnifyBy: CGFloat = 1.0

    private var magnificationGesture: some Gesture {
        MagnificationGesture()
            .onChanged { value in
                magnifyBy = value
            }
            .onEnded { value in
                if value > maxZoom {
                    magnifyBy = maxZoom
                } else if value < minZoom {
                    magnifyBy = minZoom
                } else {
                    magnifyBy = value
                }
            }
    }

    private var resetGesture: some Gesture {
        TapGesture(count: 2)
            .onEnded { _ in
                magnifyBy = 1.0
            }
    }

    public init(size: CGSize,
                minZoom: CGFloat = 1.0,
                maxZoom: CGFloat = 3.0,
                showIndicators: Bool = false) {
        self.size = size
        self.minZoom = minZoom
        self.maxZoom = maxZoom
        self.showsIndicators = showIndicators
    }

    public func body(content: Content) -> some View {
        ScrollView([.horizontal, .vertical], showsIndicators: showsIndicators) {
            content
                .frame(width: size.width * magnifyBy,
                       height: size.height * magnifyBy,
                       alignment: .center)
                .scaleEffect(magnifyBy, anchor: .center)

        }
        .gesture(ExclusiveGesture(magnificationGesture, resetGesture))
        .animation(.easeInOut, value: magnifyBy)
    }
}

