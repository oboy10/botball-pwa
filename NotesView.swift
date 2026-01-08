import SwiftUI

struct NotesView: View {
    @State private var notes: [String] = []
    @State private var input = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.black, .gray.opacity(0.3)],
                               startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    HStack {
                        TextField("New note…", text: $input)
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(16)
                            .foregroundColor(.white)
                            .font(.body)
                        
                        Button(action: {
                            guard !input.isEmpty else { return }
                            notes.insert(input, at: 0)
                            input = ""
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .font(.system(size: 28))
                                .foregroundColor(.cyan)
                        }
                    }
                    .padding(.horizontal)
                    
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(notes, id: \.self) { note in
                                Text(note)
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(.ultraThinMaterial)
                                    .cornerRadius(16)
                                    .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 5)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Team Notes")
        }
    }
}
