import SwiftUI

struct ListView: View {
    var people = Person.allPeople
    
    var body: some View {
        List(people) { person in
            ListRowView(title: person.name, age: person.age)
        }
    }
}

struct ListRowView: View {
    var title: String
    var age: Int
    
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .padding()
                .foregroundColor(.red)
            
            Text(title)
            Spacer()
            Text("\(age)")
        }
    }
}

class Person: Identifiable {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    static var allPeople = [
        Person(name: "Piet", age: 20),
        Person(name: "Jan", age: 25),
        Person(name: "Franna", age: 30),
        Person(name: "Shashi", age: 10),
        Person(name: "Slav", age: 5),
        Person(name: "Nikki", age: 50)
    ]
}
