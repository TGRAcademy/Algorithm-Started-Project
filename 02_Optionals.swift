import Foundation

/*
 # ✈️ Swift Fundamentals — Part 2
 ## Optionals
 
 An **optional** is a type that can hold either a value or `nil`.
 Swift uses optionals to express the *absence* of a value safely.
 
 Declaring: `var name: String?`  ← this can be a String OR nil.
 
 In this exercise you'll work with a `Trip` model where some
 fields might be missing — just like in the real world.
*/

// ═══════════════════════════════════════════════════════════════
// MARK: - 🗂 Data Model
// ═══════════════════════════════════════════════════════════════

struct Trip {
    var destination: String?   // might not be decided yet
    var budget: Int?           // in USD — might not be set
    var duration: Int?         // in days — might not be set
}

// ─── Sample Data ─────────────────────────────────────────────
// Some trips have missing info on purpose!

let trips: [Trip] = [
    Trip(destination: "Tokyo",    budget: 2000, duration: 7),
    Trip(destination: nil,        budget: 800,  duration: 3),
    Trip(destination: "Bali",     budget: nil,  duration: 5),
    Trip(destination: "Paris",    budget: 1500, duration: nil),
    Trip(destination: "New York", budget: 3000, duration: 10),
    Trip(destination: nil,        budget: nil,  duration: nil),
]


// ═══════════════════════════════════════════════════════════════
// MARK: - Task 2A: Spot the Optional
// ═══════════════════════════════════════════════════════════════

/*
 Let's first see what happens when you print an optional directly.
 
 💡 Notice the "Optional(...)" wrapper in the output — that's Swift
    telling you it's an optional value, not a plain String.
*/

print("═══════════════════════════════════════")
print("  Task 2A: Printing Optionals")
print("═══════════════════════════════════════")

for (index, trip) in trips.enumerated() {
    // Notice the output: Optional("Tokyo"), nil, etc.
    print("Trip \(index + 1) destination: \(String(describing: trip.destination))")
}

// 💡 Question: Why does the output look ugly with "Optional(...)"?
//    Because Swift wraps optional values to distinguish them from
//    non-optional ones. We need to *unwrap* them for clean output.

print()


// ═══════════════════════════════════════════════════════════════
// MARK: - Task 2B: The Danger of Force Unwrapping
// ═══════════════════════════════════════════════════════════════

/*
 ⚠️ Force unwrapping uses `!` to extract the value.
    If the value is nil → your program CRASHES.
*/

print("═══════════════════════════════════════")
print("  Task 2B: Force Unwrap (Danger!)")
print("═══════════════════════════════════════")

let safeTrip = trips[0]    // Tokyo — has all values
let riskyTrip = trips[1]   // destination is nil!

// ✅ This works because destination is "Tokyo":
print("✅ Safe: \(safeTrip.destination!)")

// 🚨 DANGER — Uncomment the line below to see a crash:
// print("💥 Crash: \(riskyTrip.destination!)")
//
// 💡 Question: Why does this crash?
//    Because `destination` is nil, and force-unwrapping nil
//    causes a fatal error at runtime.

print()


// ═══════════════════════════════════════════════════════════════
// MARK: - Task 2C: Nil-Coalescing Operator (??)
// ═══════════════════════════════════════════════════════════════

/*
 📖 The nil-coalescing operator `??` provides a default value
    when an optional is nil.
 
    let name = optionalName ?? "Unknown"
    → If optionalName has a value, use it.
    → If it's nil, use "Unknown" instead.
 
 TODO: Print each trip's destination using ?? to provide
       "Not decided" as the fallback.
*/

print("═══════════════════════════════════════")
print("  Task 2C: Safe Defaults with ??")
print("═══════════════════════════════════════")

// 🛠 Your code here:
for (index, trip) in trips.enumerated() {
    let destination = trip.destination ?? "Not decided"
    print("✈️ Trip \(index + 1): \(destination)")
}

print()


// ═══════════════════════════════════════════════════════════════
// MARK: - Task 2D: Handle All Fields
// ═══════════════════════════════════════════════════════════════

/*
 TODO: For each trip, print destination, budget, and duration
       with safe defaults:
       - destination → "TBD"
       - budget → "No budget"
       - duration → "Flexible"
 
 Expected output:
   Trip 1: Tokyo — $2000 — 7 days
   Trip 2: TBD — $800 — 3 days
   Trip 3: Bali — No budget — 5 days
   Trip 4: Paris — $1500 — Flexible
   ...
*/

print("═══════════════════════════════════════")
print("  Task 2D: Complete Trip Info")
print("═══════════════════════════════════════")

// 🛠 Your code here:
for (index, trip) in trips.enumerated() {
    let dest = trip.destination ?? "TBD"
    let cost = trip.budget != nil ? "💸 $\(trip.budget!)" : "💸 No budget"
    let days = trip.duration != nil ? "📅 \(trip.duration!) days" : "📅 Flexible"
    print("Trip \(index + 1): \(dest) — \(cost) — \(days)")
}

// 💡 Think about: We used `!` above after checking for nil with `!= nil`.
//    This is *technically* safe, but there's a better way — you'll learn
//    it in Part 3 (if let)!

print()


// ═══════════════════════════════════════════════════════════════
// MARK: - 🎓 Key Takeaways
// ═══════════════════════════════════════════════════════════════

/*
 ✅ Optionals (?) represent a value that might be absent (nil).
 ✅ Printing an optional directly shows "Optional(...)" — unwrap first!
 ✅ Force unwrapping (!) crashes if the value is nil. Avoid it.
 ✅ The nil-coalescing operator (??) provides a safe fallback value.
 ✅ Always assume an optional COULD be nil and handle it.
 
 ⚠️ Common Mistake:
    Using `!` everywhere — it works until it doesn't, and then
    your app crashes with no helpful error message.
 
 🔜 Next: Part 3 — if let (Optional Binding)
*/
