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
#CLEAR
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
    -You slump over, regretting ever signing up with your last agonal gasps of breath.
    + Gasp
        -> game_over(-> helicopter_landing)
-> END

=== facility_entrance ===
#CLEAR
You step off the helicopter and take a look around. All you see is tall grass in the field and the surrounding forest. 
Razor heads towards the forest, while the rest of the team follows. You stay with the pack, ensuring to be vigilant. As you enter the treeline, you notice an unnatural hill of dirt and moss. You circle around to see a titanium door built into the mound.
This must be the entrance to the facility in the briefing. Razor assigns you as the point man.

+ Open the door
    -> open_facility_entrance
-> END

=== open_facility_entrance ===
#CLEAR
Razor scans an id card at the terminal by the front door. An affirmative beep tones and he nods at you to open the door. After taking a deep breath, you pull down on the handle and open the door.

The metal creaks as the door opens. It's dark inside and you turn on the flashlight attached to your vest. It pierces through the darkness and illuminates a figure.

You shout out to the figure that you're there to help. It inhumanly turns around. You shine the light on its' face and see growths coming out of leathery uneven skin. A putrid stench hits you. Rotting flesh and pus drip from its face. You realize this figure isn't human.

It lunges at you with surprising speed, considering it's sluggish turn-around. You prime to defend yourself.

+ {has_knife} Use the combat knife
    You draw the knife just in time to slash the mutant's throat. It barely responds to the pain, but the wound clearly caused some damage as it staggers back. You take the opportunity to stab the knife into the mutants head. It quickly crumbles.
+ {ammo > 0} Use the assault rifle
    ~ammo -= 1
    You aim your rifle for body mass and fire several bursts. The mutant staggers with each wave of rounds, until eventually succumbing. You peer over your firing sight. {ammo} magazines of ammunition remaining.

- The mutant lays dead on the floor. You are in disbelief, even though you'd been warned many times in the briefing. Razor walks up to you and places a a reassuring hand on your shoulder.
- "First time you see one is always shocking, but keep doing as you are and you'll make it out alright."
- You refocus on the mission at hand. Save any survivors and retrieve the research data.
+ Continue down the hallway
    -> main_hallway
-> END

=== main_hallway ===
#CLEAR
~store_previous_player_stats()

-You cautiously walk down the hallway. Razor and the team close behind. Scanning from left to right for anymore aberrations. 

-The team's radio operator reports back to command on successful entry into the facility. The squawk from the radio is jarring through the silence, but the acknowledgement from the command center reminds you that you have an exit plan from this place.

-As you patrol down the hall, you notice in the distance another mutant. It's back is turned and is facing into a turn of the hallway. This time you don't make the same mistake to alert the mutant to your position. Razor tells you that the team will follow your lead on what to do.

    + Sneak past the mutant
        --You decide to conserve ammunition and sneak past the mutant. You silenty walk behind the mutant, doing your best to not alert. It seems to be working until you round the corner and see two more mutants staring directly at you. You aim your rifle and fire, but they are too close at this point.
        --One leaps on you and bites into your carotid artery. Your team is able to shoot them down, but it's too late for you at this point. The medic runs over to you and administers a shot of morphine. At least it won't be too painful at the end.
        ** Sleep it off
            -> game_over(-> main_hallway)
    
    + {ammo > 0} Use the assault rifle
        ~ammo -= 1
        --From a safe distance, you aim your rifle at the humanoid mutant parasite. You drop it with one burst of fire into the mutant's head. Right after, two more mutants round the corner, aggresively hunting the source of the noise.
        --Keeping your aim steady, you expend the rest of the magazine to dispatch the two mutants with deadly accuracy. {ammo} magazines of ammunition remaining.
        --After rounding the corner, you see a door labeled laboratory.
        ** Enter the laboratory
            ---> lab
-> END

=== lab ===
#CLEAR
Razor scans his card at the terminal and the door unlocks. You open it up again and are delighted to see the room is properly lit. 
"BRT team is here, anyone alive?" Razor shouts. A head pops up behind a long desk covered with scientific equipment.

Fortunately, it's human and it speaks. "What took you so long?" The agitated scientist's anger seemed to be hiding the terror bubbling underneath. She stood up and walks over to Razor, handing him a hard drive.
"This is most of the lab's research data. However, the last remaining part of the research data is in the testing area. Unfortunately, that's also where a new errant is."
The briefing comes back to you, errants are what they refer to these radioactive mutant parasites as.
"It's imperative you get that research. This new errant was engineered with a complete focus on one sense, sight. If it notices any change in the visual environment it will visciously attack."
+ Evacuate the survivors
    -> lab_2
    
=== lab_2 ===
#CLEAR
The scientist goes around the lab and gathers the remaining survivors. Razor dispatches two team members to escort them back to the helicopter for evacuation.

"We'll be right behind you, get the survivors and this hard drive back to the helicopter" Razor waves them off and turns back towards you.

"Do you have any extra ammo? I'm running low"
You still have {ammo} magazines left.
+ {ammo > 1} Give Razor extra ammo
    -- "Appreciate it!" Razor is grateful for the ammo.
+ Keep your ammo
    -- "I Undersand." Razor counts the few rounds he has left.
- "You're on point again." Razor nods at you and you take the lead.
+ Head towards the testing area
    -- -> path_to_testing_area
-> END

=== path_to_testing_area ===
#CLEAR
You exit the lab and see your teammates escorting the survivors back to the entrance. Part of you wishes you were heading there with them. You turn right, heading further into the depths of the facility.
At the end of the hallway you come to a door labeled testing area. Large Biohazard warning signs are displayed around the entrance. It doesn't give you a great feeling.
Razor walks up to the card key terminal and unlocks the door. Time to see this errant yourself.
+ Open the door
    -> testing_area
-> END

=== testing_area ===

-> END
=== escape ===
-> END

=== ending ===
#CLEAR
You survived!
+ Start Over
    -> intro
-> END

=== game_over(-> last_decision) ===
#CLEAR
Mission Failed!
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
~ prev_has_knife = has_knife

=== function load_previous_player_stats ===
~ health = prev_health
~ is_bitten = prev_is_bitten
~ ammo = prev_ammo
~ has_knife = prev_has_knife