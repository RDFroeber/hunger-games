The Hunger Games
================
[The Rules](girl_on_fire.md)


## ERD:
+ Game
  * has a President
  * has a name (i.e. 74th Hunger Games)
  * has 6 zones (in the arena)
+ Rounds
  * has a game_id reference
  * *belongs to Game*
  * has many Tributes (Rounds_Tributes join table)
+ Districts
  * has a name (i.e. The Capitol or District 12)
+ Citizens
  * has a district_id reference
  * *belongs to District*
  * has a name
  * has a gender
  * has an age
  * has tesserae
  * is alive?
+ Tributes
  * has a citizen_id reference
  * *belongs to Citizen*
  * has a skill
  * has a skill rating
  * has many Rounds (Rounds_Tributes join table)
  * has many Sponsors (Tributes_Sponsors join table)
+ Sponsors
  * has a citizen_id reference
  * *belongs to Citizen*
  * has many Tributes (Tributes_Sponsors join table)



## User Stories:
**Gamemaker**

*The Reaping*

1. As a Gamemaker, I start the Reaping so that there are tributes for the game.

2. As a Gamemaker, I select one male and one female tribute from each district so that the rules of the game are followed.

3. As a Gamemaker, I assign an escort to the tributes so that they have a better chance of survival.

4. As a Gamemaker, I assign tesserae after each Reaping so that the distribution is fair.

*The Game*

5. As a Gamemaker, I start the Hunger Games so that people are entertained, remminded, frightened etc.

6. As a Gamemaker, I annouce the dead after each round so that the survivors are known.

7. As a Gamemaker, I end the game and announce a victor (when only one is left) so that hope survives.


---
**Citizen**

1. As a Citizen, I want to know if I am eligible for the Reaping or not so that I can mentally prepare.

2. As a Citizen, I want to know the number of tesserae I have so that I know my chances of being reaped.

3. As a Citizen, I want to volunteer as tribute so that I can honor my district.


---
**Tribute**

1. As a Tribute, I want to be assigned an escort so I can get sponsors.

2. As a Tribute, I want to have/know my sponsors so that I have a better chance of survival.

3. As a Tribute, I want to know my fellow district Tribute so that I have a better chance of survival.

4. As a Tribute, I want to know other tributes that I have a better chance of survival.

5. As a Tribute, I want to gain skills so that I can get a better rating.

6. As a Tribute, I want to get a high rating so that my chances of allies are higher.

7. As a Tribute, I want to kill my fellow adversaries/Tributes so that I can survive.


---
**Sponsor**

1. As a Sponsor, I want to support a Tribute so that they have a better chance of survival.

2. As a Sponsor, I want to know the Tributes I am supporting so that I don't go broke.


---
**Escort**

1. As a Escort, I want to know which Tributes I am assigned to so that I can impart my wisdom upon them.

2. As a Escort, I want to get sponsors for Tributes so that they have a better chance of survival.

3. As a Escort, I give advice/assign skills so that my Tributes can get a better rating.

