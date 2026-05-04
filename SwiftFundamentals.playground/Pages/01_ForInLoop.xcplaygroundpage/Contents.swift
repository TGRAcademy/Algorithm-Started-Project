import Foundation

/*
 # ✈️ Swift Fundamentals — Part 1
 ## for-in Loop
 
 A `for-in` loop lets you iterate over every element in a
 collection (array, range, dictionary, etc.).
 
 In this exercise you'll loop through an array of trips
 and print basic information.
*/

// ═══════════════════════════════════════════════════════════════
// MARK: - 🗂 Data Model
// ═══════════════════════════════════════════════════════════════

struct Trip {
    var destination: String
    var budget: Int       // in USD
    var duration: Int     // in days
}

// ─── Sample Data ─────────────────────────────────────────────

let trips: [Trip] = [
    Trip(destination: "Tokyo",    budget: 2000, duration: 7),
    Trip(destination: "Bali",     budget: 1200, duration: 5),
    Trip(destination: "Paris",    budget: 1500, duration: 4),
    Trip(destination: "New York", budget: 3000, duration: 10),
    Trip(destination: "Seoul",    budget: 900,  duration: 3),
]


// ═══════════════════════════════════════════════════════════════
// MARK: - Task 1A: Basic for-in Loop
// ═══════════════════════════════════════════════════════════════

/*
 TODO: Loop through the `trips` array and print each destination.
 
 Expected output:
   ✈️ Tokyo
   ✈️ Bali
   ✈️ Paris
   ...
*/

print("═══════════════════════════════════════")
print("  Task 1A: Print All Destinations")
print("═══════════════════════════════════════")

// 🛠 Your code here:



// ═══════════════════════════════════════════════════════════════
// MARK: - Task 1B: Loop with Index
// ═══════════════════════════════════════════════════════════════

/*
 TODO: Use `enumerated()` to print each trip with its number.

 💡 Hint: `for (index, trip) in trips.enumerated()`
 
 Expected output:
   Trip 1: Tokyo — $2000 — 7 days
   Trip 2: Bali — $1200 — 5 days
   ...
*/

print("═══════════════════════════════════════")
print("  Task 1B: Numbered Trip List")
print("═══════════════════════════════════════")

// 🛠 Your code here:


print()


// ═══════════════════════════════════════════════════════════════
// MARK: - 🎓 Key Takeaways
// ═══════════════════════════════════════════════════════════════

/*
 ✅ `for item in collection` iterates over every element.
 ✅ `for (index, item) in collection.enumerated()` gives you both
    the index and the element.
 ✅ You can filter items inside the loop with `if`.
 ✅ `for i in 1...10` loops over a range of numbers.
 ✅ Combine with `.reversed()` or `stride()` for custom sequences.
 
 🔜 Next: Part 2 — Optionals
*/
