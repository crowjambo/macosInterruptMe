import SwiftUI

//force sleep now
//let task = Process()
//task.launchPath = "/usr/bin/env"
//task.arguments = ["pmset", "sleepnow"]
//task.launch()

struct ContentView: View {
    @State private var isAlertVisible = false

    var body: some View {
        ZStack {
            if isAlertVisible {
                Color.red
                    .opacity(0.7)
                    .ignoresSafeArea()
                    .overlay(
                        VStack {
                            Text("This is a Full-Screen Alert!")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding()

                            Button("Dismiss") {
                                isAlertVisible.toggle()
                            }
                            .font(.headline)
                            .padding(.top, 20)
                        }
                    )
                    .onAppear {
                        NSApp.activate(ignoringOtherApps: true)
                    }
            }
        }
        .onAppear {
            // Start a timer to trigger the alert after a set amount of seconds (e.g., 5 seconds)
            Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
                isAlertVisible = true
            }
        }
    }
}
