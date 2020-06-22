extends Node

# TODO
#
# questions
# score counter
# slowdown pickup
# slow-mo at question
# menu
# parallax clouds (faster than BG, slower than player)
# player death
#	fall
#	hit wrong answer area
# effects at fast running and full-speed running
# interactive backgrounds
#	breakable pots / physics objects
#	birds
# sprites
#	player
#		walk
#		run
#		jump
#		fall
#		roll
#	background
#	background items
#	slowdown pickup
#	platforms
#	question platform
#	menu
# music
#	menu
#	level
# sounds

# addition and subtraction (8 + 1, 7 - 2) (level 1: up to 10, level 2: up to 100)
# primes
# multiplication (8 x 7, up to 12 x 12)
# factors ("Factor of 5" ? 12 : 25, up to 12)
# division (120 / 12, up to 12 as divisor)
# comparison ("17 ? 11" ? "17 >= 11", "17 < 11")
# 
# signs with answers pointing to two paths (possibly 3 as well?) with the correct answer being
# 	safe and the other having a kill laser or evil plant or something to kill you
# 
# if you die from an answer kill area, show a hint/answer as it's resetting

const MAX_PLAYER_SPEED = 2000

var playerSpeed = 300
