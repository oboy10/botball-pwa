import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ChecklistView()
                .tabItem {
                    Image(systemName: "checklist")
                    Text("Checklist")
                }
            
            NotesView()
                .tabItem {
                    Image(systemName: "note.text")
                    Text("Notes")
                }
            
            LogsView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Logs")
                }
            
            ScheduleView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Schedule")
                }
            
            ContactsView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Contacts")
                }
        }
        .accentColor(.cyan)
        .background(
            Color.black.opacity(0.2)
                .ignoresSafeArea(edges: .bottom)
        )
    }
}
