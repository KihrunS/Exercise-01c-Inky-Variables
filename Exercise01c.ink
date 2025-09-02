/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 * Variable types: integer, float, boolean
 * Variable assignment
 * Printing variables
 * Variable checking
 
 In the assignment:
 * Add four more knots
 * Assign at least TWO new variables through player choices
 * Print at least one of the variables to the player in a passage
 * Check the value of a variable and have it do something
 
 
 Variable Checking!
 
 Equality: "Spot" == "Spot"
 Not equality: 1 != 2
 Greater: >
 Less: <
 Great or equal: >=
 Less or equal: <=
 
 
 
*/

VAR health = 5
VAR pet_name = ""
VAR torches = 0
VAR umbrella = 0
VAR lucky_number = ""
VAR torch_lit = 0
VAR umbrella_number = ""


-> memory

== memory ==
Before you stands the cavern of Josh. You wish your childhood pet was with you now. The cave might be less intimidating then. What was your pet's name?

* [Charlie]
    ~ pet_name = "Charlie"
    -> memory_2
* [Susan]
    ~ pet_name = "Susan"
    -> memory_2
* [Spot]
    ~pet_name = "Spot"
    -> memory_2

== memory_2 ==
Something you always remember on your travels is your lucky number. What was it again?

* [Seven]
    ~ lucky_number = "7"
    -> cave_mouth
* [Five]
    ~lucky_number = "5"
    -> cave_mouth
*  [Two]
    ~ lucky_number = "2"
    -> cave_mouth

== cave_mouth ==
You are at the enterance to a cave. There are torches on the walls. The cave extends to the east and west.

You made it to the cave. If only {pet_name} could see you now!

You have {torches>0:a torch.|no torches.} {torches:{torch_lit:It is lit.|It is not lit}}

{umbrella == 1:You have an umbrella.|}

+ {torch_lit == 0} {torches == 1} [Light the torch] -> torch_lighting



+ {umbrella > 0} [Take the east tunnel] -> east_tunnel_water_umbrella
+ {umbrella < 1} [Take the east tunnel] -> east_tunnel_water_no_umbrella
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel_water_no_umbrella ==
You pass under some leaking water on the way in. {torch_lit:The water puts the flame of your torch out.|The water gets you wet, but you are fine.}
~ torch_lit = 0
-> east_tunnel

== east_tunnel_water_umbrella ==
You pass under some leaking water on the way in. {torch_lit:The umbrella protects your torch from the water, keeping it lit.|The umbrella protects you from the water, keeping you dry.}
{torch_lit > 0:-> east_tunnel_lit|-> east_tunnel}

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
+ [Go Back] -> cave_mouth
-> END

== torch_lighting ==
You light the torch using another torch on the wall.
~ torch_lit = 1
-> cave_mouth

== west_tunnel ==
You are in the west tunnel. There is a rack full of umbrellas. {umbrella == 1:You already have one.|}

{pet_name == "Spot": Spot would love it here in the west|}

* [Take an umbrella] -> umbrella_pickup

+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
~ torches = torches + 1
~ torch_lit = torch_lit + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== umbrella_pickup ==
~ umbrella = 1
The umbrellas are all numbered. Which umbrella do you take?

* [Seven]
    You take umbrella number 7.
    ~ umbrella_number = "7"
    {lucky_number == umbrella_number:Naturally this is your choice, {lucky_number} is your lucky number after all!|}
    -> west_tunnel
* [Five]
    You take umbrella number 5.
    ~ umbrella_number = "5"
    {lucky_number == umbrella_number:Naturally this is your choice, {lucky_number} is your lucky number after all!|}
    -> west_tunnel
* [Two]
    You take umbrella number 2.
    ~ umbrella_number = "2"
    {lucky_number == umbrella_number:Naturally this is your choice, {lucky_number} is your lucky number after all!|}
    -> west_tunnel

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.
-> END