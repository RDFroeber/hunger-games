The Hunger Games
================
[The Rules](girl_on_fire.md)


## ERD:
+ Game
  * has a President
  * has a name (i.e. 74th Hunger Games)
+ Rounds
  * has a game_id reference
  * *belongs to Game*
  * has 6 zones (in the arena)
  * has many Tributes (Rounds_Citizens join table)
+ Districts
  * has a name (i.e. The Capitol or District 12)
  * has an industry
+ Citizens
  * has a district_id reference
  * *belongs to District*
  * has a type (Single Table Inheritance)
  * has a name
  * has a gender
  * has an age
  * has tesserae
  * is alive?
+ Citizen Type: Tributes
  * has a game_id reference (added relationship for ease of reference)
  * *belongs to Game*
  * has a skill
  * has a skill rating
  * has many Rounds (Rounds_Citizens join table)
  * has many Sponsors (self join table)
+ Citizen Type: Sponsors
  * has a signature style
  * has many Tributes (self join table)



## User Stories:
**As a Gamemaker**

*The Reaping*

1. I start the Reaping so that there are tributes for the game.

2. I select one male and one female tribute from each district so that the rules of the game are followed.

3. I assign an escort to the tributes so that they have a better chance of survival.

4. I assign tesserae after each Reaping so that the distribution is fair.

*The Game*

5. I start the Hunger Games so that people are entertained, remminded, frightened etc.

6. I want to know the outcome of each round so that I can announce the dead.

7. I annouce the dead after each round so that the survivors are known.

8. I end the game and announce a victor (when only one is left) so that hope survives.


---
**As a Citizen**

1. I want to know if I am eligible for the Reaping or not so that I can mentally prepare.

2. I want to know the number of tesserae I have so that I know my chances of being reaped.

3. I want to volunteer as tribute so that I can honor my district.


---
**As a Tribute**

1. I want to be assigned an escort so I can get sponsors.

2. I want to have/know my sponsors so that I have a better chance of survival.

3. I want to know my fellow district Tribute so that I have a better chance of survival.

4. I want to know other tributes that I have a better chance of survival.

5. I want to gain skills so that I can get a better rating.

6. I want to get a high rating so that my chances of allies are higher.

7. I want to kill my fellow adversaries/Tributes so that I can survive.


---
**As a Sponsor**

1. I want to support a Tribute so that they have a better chance of survival.

2. I want to know the Tributes I am supporting so that I don't go broke.


---
**As an Escort**

1. I want to know which Tributes I am assigned to so that I can impart my wisdom upon them.

2. I want to get sponsors for Tributes so that they have a better chance of survival.

3. I give advice/assign skills so that my Tributes can get a better rating.

