# "ILS VEULENT TOUS MA POO" – Ruby OOP Mini-Game

**Disclaimer:** This project was created as part of a student assignment for THP (web dev school). It is an educational exercise in Ruby and Object-Oriented Programming (OOP).

---

## Overview

This is a console-based mini-game implemented in Ruby, where the goal is to survive against computer-controlled opponents. The game evolved through three versions:

### Version 1.0 – Basic Gameplay
- Simple turn-based game.
- Player can attack computer-controlled enemies.
- Displays life points of all characters.
- End condition: player or enemies defeated.

### Version 2.0 – Refactoring & Multiple Enemies
- Code reorganized for clarity.
- Introduced the `Player` and `HumanPlayer` classes.
- Player can choose actions: search weapon, heal, or attack an enemy.
- Multiple enemies can be attacked in turn.
- Game logic separated from the main script, making it easier to maintain.

### Version 3.0 – Progressive Enemy Appearance
- Introduced the `Game` class to centralize game logic.
- Added attributes: `@players_left` and `@enemies_in_sight`.
- Enemies appear gradually, simulating a dynamic battlefield.
- Methods in `Game` handle:
  - Player status display
  - Menu and user choices
  - Enemy attacks
  - Adding new enemies in view
  - Checking ongoing game state
  - Ending the game
- Game loop in `app_3.rb` coordinates all interactions.

---

## How to Play
1. Clone the repository.
2. Run the main script:
   ```bash
   ruby app_3.rb
