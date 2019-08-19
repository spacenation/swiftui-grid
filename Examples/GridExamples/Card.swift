import SwiftUI

struct Card: View {
    var title: String
    var body: some View {
        ZStack(alignment: .init(horizontal: .center, vertical: .center)) {
            Rectangle()
                .foregroundColor(.random)
            Text(title)
                .font(.title)
                .foregroundColor(.white)
                .opacity(0.5)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(Color.white.opacity(0.3), lineWidth: 4)
        )
        .cornerRadius(16)
    }
}

#if DEBUG
struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(title: "1")
    }
}
#endif
