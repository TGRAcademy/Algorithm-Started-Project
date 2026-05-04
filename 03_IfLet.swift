import Foundation

/*
 # ✈️ Swift Fundamentals — Part 3
 ## if let (Optional Binding)
 
 `if let` safely unwraps an optional. If the value exists,
 you can use the unwrapped value inside the `if` block.
 If it's nil, the `else` block runs.
 
     if let unwrapped = someOptional {
         // unwrapped is available here — non-optional!
     } else {
         // someOptional was nil
     }
 
 This is much safer than force unwrapping with `!`.
*/

// ═══════════════════════════════════════════════════════════════
// MARK: - 🗂 Data Model
// ═══════════════════════════════════════════════════════════════

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


// ═══════════════════════════════════════════════════════════════
// MARK: - Task 3A: Basic if let
// ═══════════════════════════════════════════════════════════════

/*
 TODO: Loop through `trips`. For each trip, use `if let` to unwrap
       the destination.
       - If it exists → print "✈️ Trip X: {destination}"
       - If nil       → print "⚠️ Trip X: Destination missing!"
 
 Expected output:
   ✈️ Trip 1: Tokyo
   ⚠️ Trip 2: Destination missing!
   ✈️ Trip 3: Bali
   ...
*/

print("═══════════════════════════════════════")
print("  Task 3A: Unwrap Destinations")
print("═══════════════════════════════════════")

// 🛠 Your code here:

print()


// ═══════════════════════════════════════════════════════════════
// MARK: - Task 3B: Unwrap Multiple Values
// ═══════════════════════════════════════════════════════════════

/*
 📖 You can chain multiple `if let` bindings with commas:
 
     if let a = optA, let b = optB {
         // both a AND b are unwrapped here
     }
 
 TODO: For each trip, unwrap destination AND budget together.
       Print a message only when BOTH exist.
       Otherwise print a warning.
 
 Expected output:
   ✅ Tokyo — Budget: $2000
   ⚠️ Trip 2: Missing destination or budget
   ⚠️ Trip 3: Missing destination or budget
   ✅ Paris — Budget: $1500
   ✅ New York — Budget: $3000
   ⚠️ Trip 6: Missing destination or budget
*/

print("═══════════════════════════════════════")
print("  Task 3B: Multiple Unwraps")
print("═══════════════════════════════════════")

// 🛠 Your code here:


print()


// ═══════════════════════════════════════════════════════════════
// MARK: - Task 3C: if let with Conditions
// ═══════════════════════════════════════════════════════════════

/*
 📖 You can add extra conditions after `if let`:
 
     if let budget = trip.budget, budget > 1000 {
         // budget exists AND is greater than 1000
     }
 
 TODO: Find and print only the trips where:
       - destination exists
       - budget exists AND is greater than $1500
 
 Expected output:
   🌟 Premium trip: Tokyo — $2000
   🌟 Premium trip: New York — $3000
*/

print("═══════════════════════════════════════")
print("  Task 3C: Filtered Unwrap")
print("═══════════════════════════════════════")

// 🛠 Your code here:


// 💡 Think about: How is this different from using `??` ?
//    With `??` you always get a value (real or default).
//    With `if let` you can choose to SKIP items that are nil.
//    Each approach has its place!

print()


// ═══════════════════════════════════════════════════════════════
// MARK: - Task 3D: Nested vs Flat
// ═══════════════════════════════════════════════════════════════

/*
 💡 Compare these two approaches:
 
 ❌ NESTED (hard to read with many optionals):
 
     if let dest = trip.destination {
         if let budget = trip.budget {
             if let duration = trip.duration {
                 print("\(dest) \(budget) \(duration)")
             }
         }
     }
 
 ✅ FLAT (chained — much cleaner):
 
     if let dest = trip.destination,
        let budget = trip.budget,
        let duration = trip.duration {
         print("\(dest) \(budget) \(duration)")
     }
 
 TODO: Rewrite the nested version below as a flat chained `if let`.
*/

print("═══════════════════════════════════════")
print("  Task 3D: Clean It Up")
print("═══════════════════════════════════════")

// ❌ Nested version (works but messy):
print("Nested:")
for (index, trip) in trips.enumerated() {
    if let dest = trip.destination {
        if let budget = trip.budget {
            if let duration = trip.duration {
                print("  Trip \(index + 1): \(dest) — $\(budget) — \(duration) days")
            }
        }
    }
}

print()

// ✅ TODO: Rewrite as flat chained if let:
print("Flat (your version):")


print()


// ═══════════════════════════════════════════════════════════════
// MARK: - 🎓 Key Takeaways
// ═══════════════════════════════════════════════════════════════

/*
 ✅ `if let` safely unwraps optionals without risk of crashing.
 ✅ Chain multiple unwraps with commas: `if let a = x, let b = y`.
 ✅ Add conditions after unwraps: `if let a = x, a > 10`.
 ✅ Prefer flat chaining over deep nesting for readability.
 ✅ The unwrapped variable only exists INSIDE the if block.
 
 ⚠️ Common Mistake:
    Trying to use the unwrapped variable OUTSIDE the if block.
    It only exists in the scope where it was unwrapped.
 
 💡 When to use `if let` vs `??`:
    - Use `??` when you always need a value (with a default).
    - Use `if let` when you want to branch (do X or Y).
 
 🔜 Next: Part 4 — guard let (Early Exit)
*/
