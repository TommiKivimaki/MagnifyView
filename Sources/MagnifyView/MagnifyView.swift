import SwiftUI

@available(iOS 15, *)
public struct MagnifyView<Content>: View where Content: View {

    private var size: CGSize
    private var minZoom: CGFloat = 1.0
    private var maxZoom: CGFloat = 3.0
    private var showsIndicators = false

    @ViewBuilder private var content: Content

    public init(size: CGSize,
                minZoom: CGFloat = 1.0,
                maxZoom: CGFloat = 3.0,
                showIndicators: Bool = false,
                @ViewBuilder content: @escaping () -> Content) {
        self.size = size
        self.minZoom = minZoom
        self.maxZoom = maxZoom
        self.showsIndicators = showIndicators
        self.content = content()
    }

    public var body: some View {
        content
            .frame(width: size.width,
                   height: size.height,
                   alignment: .center)
            .magnifying(size: size,
                      minZoom: minZoom,
                      maxZoom: maxZoom,
                      showIndicators: showsIndicators)
    }
}

struct MagnifyView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GeometryReader { geo in
                MagnifyView(size: CGSize(width: geo.size.width, height: 200)) {
                    Text(".This is a text for a preview.")
                }
            }

            GeometryReader { geo in
                MagnifyView(size: geo.size) {
                    Image(packageResource: "testImage", ofType: "jpg")
                        .resizable()
                }
            }
        }
    }
}
