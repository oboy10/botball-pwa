import SwiftUI

struct ChecklistItem: Identifiable {
    let id = UUID()
    let text: String
    var done: Bool = false
}

struct ChecklistView: View {
    @State private var items = [
        ChecklistItem(text: "Batteries charged"),
        ChecklistItem(text: "Motors plugged in"),
        ChecklistItem(text: "Sensors calibrated"),
        ChecklistItem(text: "Code uploaded"),
        ChecklistItem(text: "Start position set"),
        ChecklistItem(text: "Lock tf in"),

    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.black, .gray.opacity(0.3)],
                               startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach($items) { $item in
                            HStack {
                                Button(action: { item.done.toggle() }) {
                                    Image(systemName: item.done ? "checkmark.circle.fill" : "circle")
                                        .font(.system(size: 26))
                                        .foregroundColor(item.done ? .cyan : .gray)
                                        .padding(.trailing, 8)
                                }
                                
                                Text(item.text)
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .strikethrough(item.done)
                                
                                Spacer()
                            }
                            .padding()
                            .background(.ultraThinMaterial) // glass effect
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Run Checklist")
        }
    }
}
