import Foundation

/*
 # ✈️ Swift Fundamentals — Part 6
 ## Combine Everything 🎯
 
 Time to put it all together! In this final exercise you'll use
 every concept from Parts 1–5:
 
 - **for-in loop** → iterate over data
 - **Optionals** → handle missing values
 - **if let** → conditionally unwrap
 - **guard let** → validate and exit early
 - **Computed properties** → format and derive data
 
 You'll build a polished Trip Report from scratch.
*/

// MARK: - 🗂 Data Model

struct Trip {
    var destination: String?
    var budget: Int?
    var duration: Int?
    
    var summary: String {
        let dest = destination ?? "Unknown"
        let cost = budget != nil ? "$\(budget!)" : "N/A"
        let days = duration != nil ? "\(duration!) days" : "N/A"
        return "📍 \(dest) — 💸 \(cost) — 📅 \(days)"
    }
    
    var costPerDay: Int? {
        guard let budget = budget,
              let duration = duration,
              duration > 0 else {
            return nil
        }
        return budget / duration
    }
    
    var isComplete: Bool {
        return destination != nil && budget != nil && duration != nil
    }
    
    var valueRating: String {
        guard let cpd = costPerDay else { return "⬜ Unrated" }
        switch cpd {
        case ..<200:  return "🟢 Great value"
        case ..<350:  return "🟡 Fair price"
        default:      return "🔴 Premium"
        }
    }
}

// ─── Sample Data ─────────────────────────────────────────────

let trips: [Trip] = [
    Trip(destination: "Tokyo",     budget: 2000,  duration: 7),
    Trip(destination: nil,         budget: 800,   duration: 3),
    Trip(destination: "Bali",      budget: nil,   duration: 5),
    Trip(destination: "Paris",     budget: 1500,  duration: nil),
    Trip(destination: "New York",  budget: 3000,  duration: 10),
    Trip(destination: nil,         budget: nil,   duration: nil),
    Trip(destination: "Seoul",     budget: 900,   duration: 6),
    Trip(destination: "Lisbon",    budget: 1100,  duration: 8),
]


// MARK: - Task 6A: Full Trip Report

print("╔═══════════════════════════════════════╗")
print("║     ✈️  TRIP REPORT — FINAL REVIEW    ║")
print("╚═══════════════════════════════════════╝")
print()

var validTrips: [Trip] = []
var skippedCount = 0

for (index, trip) in trips.enumerated() {
    guard let destination = trip.destination,
          let budget = trip.budget,
          let duration = trip.duration else {
        skippedCount += 1
        print("  ⚠️ Trip \(index + 1): Incomplete — skipped")
        continue
    }
    
    validTrips.append(trip)
    
    print("  \(trip.summary)")
    
    if let cpd = trip.costPerDay {
        print("     → 💰 $\(cpd)/day  \(trip.valueRating)")
    }
    
    print()
}

print("─────────────────────────────────────────")
print("  📊 Total: \(validTrips.count) valid, \(skippedCount) skipped")
print()


// MARK: - Task 6B: Find the Best Deal

print("═══════════════════════════════════════")
print("  🏆 Best Deal")
print("═══════════════════════════════════════")

var bestTrip: Trip? = nil
var lowestCPD = Int.max

for trip in validTrips {
    if let cpd = trip.costPerDay, cpd < lowestCPD {
        lowestCPD = cpd
        bestTrip = trip
    }
}

if let best = bestTrip {
    print("  🥇 \(best.summary)")
    print("     → Only $\(lowestCPD)/day! \(best.valueRating)")
} else {
    print("  No valid trips to compare.")
}

print()


// MARK: - Task 6C: Group by Value Rating

print("═══════════════════════════════════════")
print("  📂 Trips by Value Rating")
print("═══════════════════════════════════════")

let greatValue = validTrips.filter { ($0.costPerDay ?? Int.max) < 200 }
let fairPrice  = validTrips.filter {
    guard let cpd = $0.costPerDay else { return false }
    return cpd >= 200 && cpd < 350
}
let premium    = validTrips.filter { ($0.costPerDay ?? 0) >= 350 }

if !greatValue.isEmpty {
    print("  🟢 Great Value:")
    for trip in greatValue {
        let dest = trip.destination ?? "Unknown"
        print("     - \(dest) — $\(trip.costPerDay!)/day")
    }
}

if !fairPrice.isEmpty {
    print("  🟡 Fair Price:")
    for trip in fairPrice {
        let dest = trip.destination ?? "Unknown"
        print("     - \(dest) — $\(trip.costPerDay!)/day")
    }
}

if !premium.isEmpty {
    print("  🔴 Premium:")
    for trip in premium {
        let dest = trip.destination ?? "Unknown"
        print("     - \(dest) — $\(trip.costPerDay!)/day")
    }
}

print()

/*
 🎓 Workshop Key Takeaways — Congratulations! 🎉
 
 ✅ for-in loop → Iterate over arrays, ranges, and collections.
 ✅ Optionals (?) → Represent values that might be absent. Use ?? for safe defaults.
 ✅ if let → Safely unwrap when you want to branch.
 ✅ guard let → Safely unwrap with early exit. Keeps code flat.
 ✅ Computed Properties → Calculate values on the fly. Always in sync.
 
 ⚠️ Common Mistakes to Avoid:
 ❌ Force unwrapping (!) without checking for nil
 ❌ Confusing if let vs guard let
 ❌ Forgetting `continue` / `return` in guard's else block
 ❌ Printing Optional("...") instead of unwrapping
 ❌ Using stored properties for derived data
 
 🚀 Next steps:
    → Try adding more trips to the data
    → Add new computed properties (e.g., luxury tier by budget)
    → Experiment with modifying trip values and re-printing
 
 Happy coding! 🎉
*/
