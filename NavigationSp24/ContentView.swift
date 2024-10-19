import SwiftUI

struct moonDestination: Hashable { // had to go online and find another way because an error was popping up with the original template. looked up and understood the code and wrote it myself
    var earthWeight: Double
}
struct jupiterDestination: Hashable {
    var earthWeight: Double
    var moonWeight: Double
}

struct ContentView: View {
    @State private var path = NavigationPath()
    @State var message: String = ""
    @State var earthWeight: String = ""

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("Welcome to Space Walk App")
                    .font(.largeTitle)
                    .padding(.top)
                Spacer()
                Text("You are on Earth now")
                    .font(.headline)
                    .padding(.bottom, 20)
                TextField("Please enter your Weight (kg)", text: $earthWeight)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                if (!message.isEmpty) {
                    
                    Text(message)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                }
                
                Image("Earthimage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding()
                Button("Go to the Moon View") { // earth to moon
                    if let weight = Double(earthWeight) {
                        path.append(moonDestination(earthWeight: weight))
                    }
                }
                .padding()
                .disabled(earthWeight.isEmpty)
            }
            .navigationTitle("Earth View")
            .navigationDestination(for: moonDestination.self) { destination in
                MoonView(earthWeight: destination.earthWeight, path: $path, message: $message)
            }
            .navigationDestination(for: jupiterDestination.self) { destination in
                JupiterView(earthWeight: destination.earthWeight, moonWeight: destination.moonWeight, path: $path, message: $message)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
