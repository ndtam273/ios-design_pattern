import Foundation

// MARK: - Originator (A model)
public class Game: Codable {
    
    public class State: Codable {
        public var attempRemaining: Int = 3
        public var level: Int = 1
        public var score: Int = 0
    }
    public var state = State()
    
    public func rackUpMassivePoints() {
        state.score += 9002
    }
    
    public func monsterEatPlayer() {
        state.attempRemaining -= 1
    }
    
    
    
}

