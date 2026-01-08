import SwiftUI

struct LogEntry: Identifiable {
    let id = UUID()
    let date = Date()
    let robot: String
    let success: Bool
    let notes: String
}

struct LogsView: View {
    @State private var logs: [LogEntry] = []
    @State private var robotName = ""
    @State private var success = true
    @State private var notes = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.black, .gray.opacity(0.3)],
                               startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 12) {
                    HStack {
                        TextField("Robot Name", text: $robotName)
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(16)
                            .foregroundColor(.white)
                        
                        Toggle("Success", isOn: $success)
                            .labelsHidden()
                    }
                    .padding(.horizontal)
                    
                    TextField("Notes", text: $notes)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(16)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    Button(action: {
                        guard !robotName.isEmpty else { return }
                        let entry = LogEntry(robot: robotName, success: success, notes: notes)
                        logs.insert(entry, at: 0)
                        robotName = ""
                        notes = ""
                        success = true
                    }) {
                        Text("Add Log")
                            .foregroundColor(.cyan)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial)
                            .cornerRadius(16)
                    }
                    .padding(.horizontal)
                    
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(logs) { log in
                                VStack(alignment: .leading, spacing: 4) {
                                    HStack {
                                        Text(log.robot)
                                            .bold()
                                        Spacer()
                                        Text(log.success ? "✅" : "❌")
                                    }
                                    Text(log.notes)
                                        .font(.footnote)
                                    Text(log.date, style: .date)
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .background(.ultraThinMaterial)
                                .cornerRadius(16)
                                .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 5)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Robot Logs")
        }
    }
}
