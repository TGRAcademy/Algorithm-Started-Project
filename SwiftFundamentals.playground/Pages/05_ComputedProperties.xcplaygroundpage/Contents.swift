import Foundation

/*
 # ✈️ Swift Fundamentals — Part 5
 ## Computed Properties
 
 A **computed property** doesn't store a value — it calculates
 one on the fly every time you access it.
 
     var fullName: String {
         return "\(firstName) \(lastName)"
     }
 
 This is great for derived or formatted data. The value always
 stays in sync with the properties it depends on.
*/

// MARK: - 🗂 Data Model

struct Trip {
    var destination: String?
    var budget: Int?
    var duration: Int?
    
    // ─────────────────────────────────────────────────────────
    // MARK: Task 5A — Your First Computed Property
    // ─────────────────────────────────────────────────────────
    
    // TODO: Implement this computed property. Add computed property 'summary'
    //       It should return a formatted summary string.
    //       Handle nil values with ?? or if let.
    //
    // Example outputs:
    //   "📍 Tokyo — 💸 $2000 — 📅 7 days"
    //   "📍 Unknown — 💸 N/A — 📅 5 days"
    
    // 🛠 Your code here:

    
    // ─────────────────────────────────────────────────────────
    // MARK: Task 5C — More Computed Properties
    // ─────────────────────────────────────────────────────────
    
    // TODO: Add a computed property `costPerDay` that returns Int?
    //       It should return budget / duration if both exist,
    //       or nil if either is missing.
    
    // 🛠 Your code here:
    // Clue: use guard let 

    
    // TODO: Add a computed property `isComplete` that returns Bool.
    //       Returns true only if ALL three fields have values.
    
    // 🛠 Your code here:

}

let trips: [Trip] = [
    Trip(destination: "Tokyo",    budget: 2000, duration: 7),
    Trip(destination: nil,        budget: 800,  duration: 3),
    Trip(destination: "Bali",     budget: nil,  duration: 5),
    Trip(destination: "Paris",    budget: 1500, duration: nil),
    Trip(destination: "New York", budget: 3000, duration: 10),
    Trip(destination: nil,        budget: nil,  duration: nil),
]


// MARK: - Task 5A: Using the Summary Property

print("═══════════════════════════════════════")
print("  Task 5A: Trip Summaries")
print("═══════════════════════════════════════")

for (index, trip) in trips.enumerated() {
    print("Trip \(index + 1): \(trip.summary)")
}

print()



// MARK: - Task 5C: Using costPerDay and isComplete

print("═══════════════════════════════════════")
print("  Task 5C: Derived Properties")
print("═══════════════════════════════════════")

for (index, trip) in trips.enumerated() {
    let status = trip.isComplete ? "✅ Complete" : "⚠️ Incomplete"
    let cost = trip.costPerDay != nil ? "$\(trip.costPerDay!)/day" : "N/A"
    print("Trip \(index + 1): \(status) — Cost per day: \(cost)")
}

print()

/*
 🎓 Key Takeaways:
 ✅ Computed properties calculate a value every time they're accessed.
 ✅ They automatically stay in sync when other properties change.
 ✅ Great for: formatted strings, derived values, status checks.
 ✅ Computed properties can return optionals (like `costPerDay`).
 ✅ They keep formatting logic INSIDE the struct, making loops cleaner.
 
 🔜 Next: Part 6 — Combine Everything!
*/
