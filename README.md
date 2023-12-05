# 42-transcendance

+ TODO Make a diagram showing where each options in the menu leads.
+ TODO Design each of those screens and add them to the diagram.
+ TODO Add a more thorough description of each major game mode.

# Game
![Start menu](img/startmenu.png)
![Board](img/board.png)
## Description
### Graphics
+ Retro-style, bi-color, uses the same colors as the rest of the website.
  Use high contrast color scheme.

### Sound
+ Small jingle at the start of a match.
+ "Electronic" bouncing sound when the ball hit a paddle or a wall.
+ Win and lose jingles.

### Gameplay
+ On desktop keyboard only, no mouse support. On mobile / tablet touch, add
  on-screen joystick or movepad.
+ Ball slower during serve.
+ Alternate service after each point.
+ First player to 10 points, no margin required i.e 9-10 is a valid final score.
+ Game modes: vs AI, vs Human local, vs Human online, Tournament

### AI
+ No difficulty settings.
+ AI can only refresh its view of the game once per second, requiring it to
  anticipate bounces and other actions.

### Tournament
+ Allow for 4, 8 or 16 players.
+ Players are paired randomly, play their game, loser is removed from the
  tournament while winner moves on to the next round and so on.
+ Sudden-death tournament i.e single match, loser is removed from the
  tournament. This implies no draws are possible.
+ Standard scoring rule i.e first to 10 with no margin.

### Matchmaking
+ No ranking or rating system.
+ Queue system
  + If a player wants to play but no one is in the queue, he goes in the queue.
  + When a new player arrives he is matched with the one that was in the queue.

# Frontend
## Features
## Technolgy used
## Description
