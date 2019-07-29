import SwiftUI

struct CardView: View {
    let number: Int
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .frame(height: 400)
                .foregroundColor(.blue)
            ZStack {
                Rectangle()
                    .frame(height: 60)
                    .foregroundColor(Color.secondary.opacity(0.3))
                Text("Item".uppercased() + " " + "\(number)")
                    .foregroundColor(Color.white)
                    .font(.headline)
            }
        }
        .saturation(0.8)
        .cornerRadius(32)
    }
}

#if DEBUG
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(number: 999)
    }
}
#endif
