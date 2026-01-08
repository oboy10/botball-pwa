import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    let name: String
    let date: Date
}

struct ScheduleView: View {
    @State private var events: [Event] = []
    @State private var eventName = ""
    @State private var eventDate = Date()
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.black, .gray.opacity(0.3)],
                               startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 12) {
                    TextField("Event Name", text: $eventName)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(16)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    DatePicker("Date", selection: $eventDate, displayedComponents: [.date])
                        .datePickerStyle(.compact)
                        .padding(.horizontal)
                    
                    Button(action: {
                        guard !eventName.isEmpty else { return }
                        let e = Event(name: eventName, date: eventDate)
                        events.insert(e, at: 0)
                        eventName = ""
                        eventDate = Date()
                    }) {
                        Text("Add Event")
                            .foregroundColor(.cyan)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial)
                            .cornerRadius(16)
                    }
                    .padding(.horizontal)
                    
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(events) { event in
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(event.name)
                                            .bold()
                                        Text(event.date, style: .date)
                                            .font(.caption2)
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
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
            .navigationTitle("Competition Schedule")
        }
    }
}
