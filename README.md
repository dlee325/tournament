SWISS-STYLE TOURNAMENT PLANNER
Version 1.0



SYNOPSIS

The game tournament will use the Swiss system for pairing up players in each round: players are not eliminated, and each player should be paired with another player with the same number of wins, or as close as possible.




PURPOSE

Use this back-end code to tell you how to pair the players for each round either by adding and fetching data on your local postgresql DB or integrate for use on a front-end application.




INSTALLATION

1. The easiest solution is to download VirtualBox (virtualbox.org) and Vagrant (vagrantup.com). Follow instructions on their websites.

2. Download and extract the attached Tournament files into your Vagrant directory.

3. Open your terminal, change directory to the Vagrant directory (for me, it was ~/Downloads/fsnd-virtual-machine/vagrant, and type:

vagrant up
vagrant ssh

This will create a secure shell into a running Vagrant virtual machine. 

4. In the VM, change directory to where you extracted the Tournament files (for me, it was vagrant/tournament) and type:

psql -f tournament.sql

This will setup the template databases.

5. To run tests after setting up the database, type:

python tournament_test.py.



USAGE

Explanations of functions in tournament.py

registerPlayer(name)
-Adds a player to the tournament by putting an entry in the database. The database should assign an ID number to the player. Different players may have the same names but will receive different ID numbers.

countPlayers()
-Returns the number of currently registered players. This function should not use the Python len() function; it should have the database count the players.

deletePlayers()
-Clear out all the player records from the database.

reportMatch(winner, loser)
-Stores the outcome of a single match between two players in the database.

deleteMatches()
-Clear out all the match records from the database.

playerStandings()
-Returns a list of (id, name, wins, matches) for each player, sorted by the number of wins each player has.

swissPairings()
-Given the existing set of registered players and the matches they have played, generates and returns a list of pairings according to the Swiss system. Each pairing is a tuple (id1, name1, id2, name2), giving the ID and name of the paired players. For instance, if there are eight registered players, this function should return four pairings. This function should use playerStandings to find the ranking of players.




FILES INCLUDED

tournament.sql
-Defines the database schema.

tournament.py
-Code for the tournament module.

tournament_test.py
-Tests the functions in tournament.py

README.md
-Summary of program, installation & usage instructions.