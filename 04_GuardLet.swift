import Foundation

/*
 # ✈️ Swift Fundamentals — Part 4
 ## guard let (Early Exit)
 
 `guard let` is the "early exit" version of optional binding.
 If the value is nil, you **must** exit the current scope
 (using `return`, `continue`, `break`, or `throw`).
 
 This keeps your code flat — no deep nesting!
*/

// MARK: - 🗂 Data Model

struct Trip {
    var destination: String?
    var budget: Int?
    var duration: Int?
}

let trips: [Trip] = [
    Trip(destination: "Tokyo",    budget: 2000, duration: 7),
    Trip(destination: nil,        budget: 800,  duration: 3),
    Trip(destination: "Bali",     budget: nil,  duration: 5),
    Trip(destination: "Paris",    budget: 1500, duration: nil),
    Trip(destination: "New York", budget: 3000, duration: 10),
    Trip(destination: nil,        budget: nil,  duration: nil),
]

// MARK: - Task 4A: guard let in a Loop

print("═══════════════════════════════════════")
print("  Task 4A: Skip Missing Destinations")
print("═══════════════════════════════════════")

// Write Your Code Here:

print()

// MARK: - Task 4B: guard let — Multiple Fields

print("═══════════════════════════════════════")
print("  Task 4B: Only Complete Trips")
print("═══════════════════════════════════════")

// Write Your Code Here:


print()

// MARK: - Task 4C: guard let in a Function

print("═══════════════════════════════════════")
print("  Task 4C: guard let in Functions")
print("═══════════════════════════════════════")

// Write Your Code Here:
// Create printTripDetails Func


for trip in trips {
    printTripDetails(trip)
}

print()

// MARK: - Task 4D: if let vs guard let — Side by Side

print("═══════════════════════════════════════")
print("  Task 4D: if let vs guard let")
print("═══════════════════════════════════════")

print("--- if let version ---")
// Write Your Code Here:


print()

print("--- guard let version ---")
// Write Your Code Here:


/*
 💡 Key difference:
    - `if let` → the unwrapped values live INSIDE the braces.
    - `guard let` → the unwrapped values live AFTER the guard.
    
    Use guard when you want to keep the main logic un-indented
    and handle errors/missing data up front.
 
 🎓 Key Takeaways:
 ✅ `guard let` unwraps and requires an early exit if nil.
 ✅ The unwrapped value is available AFTER the guard statement.
 ✅ In loops, use `continue` in the else block.
 ✅ In functions, use `return` in the else block.
 ✅ guard let keeps your "happy path" code flat and readable.
 
 🔜 Next: Part 5 — Computed Properties
*/
