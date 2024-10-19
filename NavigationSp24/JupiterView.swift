import SwiftUI

struct JupiterView: View {
    var earthWeight: Double
    var moonWeight: Double
    @Binding var path: NavigationPath
    @Binding var message: String

    var jupiterWeight: Double {
        return earthWeight * 2.4
    }

    var body: some View {
        VStack {
            Text("You are on Jupiter")
                .font(.largeTitle)
                .padding(.top)
            Spacer()
            
            Image("Jupiterimage")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            
            Text("Your weight on Earth: \(earthWeight, specifier: "%.2f") kg")
            Text("Your weight on Jupiter: \(jupiterWeight, specifier: "%.2f") kg")
            Text("I feel much heavier!")
                .font(.headline)
                .padding(.bottom)
            Button("Go Back to Moon") { // jupiter to mooon
                message = "Coming from Jupiter"
                path.removeLast()
            }
            .padding()
            .foregroundColor(.blue)
            .border(Color.red, width: 3)
            .cornerRadius(10)
            
            Spacer()
            
            Button("Go Back to Earth") { // jupiter to  earth
                message = "Coming from Jupiter"
                path = NavigationPath()
            }
            .padding()
            .foregroundColor(.green)
            .border(Color.red, width: 3)
            .cornerRadius(10)
            
            Spacer()
        }
        .navigationTitle("Jupiter View")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct JupiterView_Previews: View {
    var body: some View {
        JupiterView(earthWeight: 70.0, moonWeight: 11.67, path: .constant(NavigationPath()), message: .constant(""))
    }
}

