//
//  AddBookView.swift
//  Bookworm
//
//  Created by Василий Буланов on 11/10/21.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showingAlert = false
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    RatingView(rating: $rating)
                    
                    TextField("Write a review", text: $review)
                }
                
                Section {
                    Button("Save") {
                        saveBook()
                    }
                }
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("You have not selected a genre"), message: Text("Please, select genre"), dismissButton: .default(Text("Ok")))
            }
            .navigationTitle("Add Book")
        }
    }
    
    func saveBook() {
        if (self.genre.isEmpty) {
            self.showingAlert = true
            return
        }
        
        let newBook = Book(context: self.moc)
        newBook.title = self.title
        newBook.author = self.author
        newBook.rating = Int16(self.rating)
        newBook.genre = self.genre
        newBook.review = self.review
        newBook.date = Date()
        
        try? self.moc.save()
        
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
