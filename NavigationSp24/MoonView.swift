import SwiftUI

struct MoonView: View {
    var earthWeight: Double
    @Binding var path: NavigationPath
    @Binding var message: String
    var moonWeight: Double {
        return (earthWeight / 6.0)
    }
    var body: some View {
        VStack {
            Text("You are on the Moon")
                .font(.largeTitle)
                .padding(.top)
            Spacer()
            Image("Moonimage")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            Text("Your weight on Earth is: \(earthWeight, specifier: "%.2f") kg")
            Text("Your weight on Moon is: \(moonWeight, specifier: "%.2f") kg")
            Text("I feel much lighter!")
                .font(.headline)
                .padding(.bottom)
            Button("Go to Jupiter") { // moon to jupiter
                path.append(jupiterDestination(earthWeight: earthWeight, moonWeight: moonWeight))
            }
            .padding()
            .foregroundColor(.blue)
            .border(Color.red, width: 3)
            .cornerRadius(10)
            
            Spacer()
            
            Button("Go back to Earth") { // moon to earth.
                message = "Coming from the Moon" // message
                path.removeLast()
            }
            .padding()
            .foregroundColor(.green)
            .border(Color.red, width: 3)
            .cornerRadius(10)
            
            Spacer()
            
            if (message == "Coming from Jupiter") {
                Text("Coming from Jupiter") // message
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Moon View")
        .navigationBarTitleDisplayMode(.inline)
    }
}
struct MoonView_Previews: View {
    var body: some View {
        MoonView(earthWeight: 70, path: .constant(NavigationPath()), message: .constant(""))
    }
}

