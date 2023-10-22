// Player Variables
VAR health = 5
VAR is_bitten = false
VAR ammo = 3
VAR has_knife = false

VAR prev_health = 5
VAR prev_is_bitten = false
VAR prev_ammo = 3
VAR prev_has_knife = false


// Start main loop
-> intro

=== intro ===
~reset_player_stats()
#CLEAR
You are part of the Biohazard Response Team. A select group of professional mercenaries gathered with the distinct purpose to clean up and remove all evidence of radioactive disturbances. This is your first mission.
Ahead of you is the transport helicopter. You have all your gear, you've triple checked to ensure that. Including an assault rifle and {ammo} magazines. However, you still feel uneasy. Must be nerves.
+ Enter the helicopter
    -> helicopter_trip
-> END

=== helicopter_trip ===
~store_previous_player_stats()
#CLEAR
You step aboard the helicopter and sit down at the first available seat. Being your first mission, you aren't very familiar with any of your team mates. You make eye contact with the man sitting across from you.
+ Engage in conversation with the man
    You introduce yourself and reach out your hand. Despite his exterior appearance, he gives back a jovial smile and shakes your hand.
    "I'm sure your nervous for your first mission, but pay attention and you'll be just fine."
    You notice he's holding a standard combat knife, despite one already being in his harness.
    "I seem to have packed a spare, why don't you take this one?"
    You gratefully accept the knife, realizing you somehow forgot to pack one.
    ~ has_knife = true
+ Lean back and enjoy the solace
    You give a friendly head nod in his direction, but aren't much in the mood for talking.
- The helicopter begins it's ascent and you realize your opportunity to leave has just ended. The nerves are back, strong as ever.
+ Enjoy the ride
    -> helicopter_landing
-> END

=== helicopter_landing ===
~store_previous_player_stats()
After some time, the helicopter begins it's descent into a forested landscape, thick with coniferous trees. You seem to be landing in the middle of field with nothing to note in sight. The uneventful landing helps to calm you a bit, but you still feel uneasy.

The team leader, known to you only as Razor, stands up and waves everyone to disembark.
+ Head on out
    -> facility_entrance
+ Your nerves are back, you refuse to leave the helicopter
    "What the hell are you doing?" Razor grabs your collar as he talks.
    He looks you up and down and he seems to have a revelation.
    "We serve an important purpose. Keeping our country safe from these mutant horrors. The nature of our work dictates that we are unsactioned publicly by the government. Which means I can deal with dead weight like this."
    Razor draws his side arm and before you can react with anything beyond pure terror, he shoots you in the throat.
    You slump over, regretting ever signing up with your last agonal gasps of breath.
    -> game_over(-> helicopter_landing)
-> END

=== facility_entrance ===
You step off the helicopter and take a look around. All you see is tall grass in the field and the surrounding forest. 
Razor heads towards the forest, while the rest of the team follows. You stay with the pack, ensuring to be vigilant. As you enter the treeline, you notice an unnatural hill of dirt and moss. You circle around to see a titanium door built into the mound.
This must be the entrance to the facility in the briefing. Razor assigns you as the point man.

+ Open the door
    -> open_facility_entrance
-> END

=== open_facility_entrance ===
Razor scans an id card at the terminal by the front door. An affirmative beep tones and he nods at you to open the door. After taking a deep breath, you pull down on the handle and open the door.

The metal creaks as the door opens. It's dark inside and you turn on the flashlight attached to your vest. It pierces through the darkness and illuminates a figure.

You shout out to the figure that you're there to help. It inhumanly turns around. You shine the light on its' face and see growths coming out of leathery uneven skin. A putrid stench hits you. You realize this figure isn't human.

It lunges at you with surprising speed, considering it's sluggish turn-around. You prime to defend yourself.

+ {has_knife} Use the combat knife
    You draw the knife just in time to slash the mutant's throat. It barely responds to the pain, but the wound clearly caused some damage as it staggers back. You take the opportunity to stab the knife into the mutants head. It quickly crumbles.
+ {ammo > 0} Use the assault rifle
    ~ammo -= 1
    You aim your rifle for body mass and fire several bursts. The mutant staggers with each wave of rounds, until eventually succumbing. You peer over your firing sight.

- The mutant lays dead on the floor. You are in disbelief, even though you'd been warned many times in the briefing. Razor walks up to you and places a a reassuring hand on your shoulder.
- "First time you see one is always shocking, but keep doing as you are and you'll make it out alright."
- You refocus on the mission at hand. Save any survivors and retrieve the research data
-> END

=== ending ===
#CLEAR
You win!
+ Start Over
    -> intro
-> END

=== game_over(-> last_decision) ===
#CLEAR
Game Over!
+ Go back to last decision
    ~load_previous_player_stats()
    -> last_decision
+ Start Over
    -> intro
-> END

// Util Functions
=== function reset_player_stats ===
~ health = 5
~ is_bitten = false
~ ammo = 3
~ has_knife = false

=== function store_previous_player_stats ===
~ prev_health = health
~ prev_is_bitten = is_bitten
~ prev_ammo = ammo

=== function load_previous_player_stats ===
~ health = prev_health
~ is_bitten = prev_is_bitten
~ ammo = prev_ammo
~ has_knife = prev_has_knife