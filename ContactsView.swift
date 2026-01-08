import SwiftUI

struct Contact: Identifiable {
    let id = UUID()
    let name: String
    let role: String
    let phone: String
}

struct ContactsView: View {
    @State private var contacts: [Contact] = []
    @State private var name = ""
    @State private var role = ""
    @State private var phone = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.black, .gray.opacity(0.3)],
                               startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 12) {
                    TextField("Name", text: $name)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(16)
                        .foregroundColor(.white)
                    
                    TextField("Role (Mentor/Student/Sponsor)", text: $role)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(16)
                        .foregroundColor(.white)
                    
                    TextField("Phone / Email", text: $phone)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(16)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        guard !name.isEmpty else { return }
                        let c = Contact(name: name, role: role, phone: phone)
                        contacts.insert(c, at: 0)
                        name = ""
                        role = ""
                        phone = ""
                    }) {
                        Text("Add Contact")
                            .foregroundColor(.cyan)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial)
                            .cornerRadius(16)
                    }
                    .padding(.horizontal)
                    
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(contacts) { contact in
                                VStack(alignment: .leading) {
                                    Text(contact.name)
                                        .bold()
                                    Text(contact.role)
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                    Text(contact.phone)
                                        .font(.footnote)
                                }
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
            .navigationTitle("Team Contacts")
        }
    }
}
