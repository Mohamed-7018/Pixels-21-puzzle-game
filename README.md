# Pixels'21 Flutter Puzzle Game

...a matching colors Flutter game! 

The goal is to reproduce the top right pattern
on the 9 center squares with as few moves as possible.

STILL IN DEVELOPMENT 

<div align="center">
	<img src="https://raw.githubusercontent.com/GLodi/matchymatchy/master/gfx/newgif.gif" width="256">
</div>

Fun fact: this app was entirely developed on [emacs](https://giuliolodi.dev/flutter-on-spacemacs)!

## Architecture

This app implements [Didier Boelens'](https://www.didierboelens.com/2018/12/reactive-programming---streams---bloc---practical-use-cases/) approach to BLoC.
The idea is to show data through widgets that react to a bloc's Stream.
In order to simplify state management, I've also implemented EventStates: 
blocs that emit a new widget's state based on an event.

## Multiplayer

Multiplayer is handled by Firebase. A Firestore database stores all matches, queue and users
information and all endpoints are Firebase Functions written in Typescript 
(project under directory **functions**).

 - Queue

When a player looks for a new match, he's put in a FIFO queue and joins a match as soon as an opponent
is found. A common target is chosen for them and whoever reaches the goal with the fewest amount of 
moves wins.

 - Reconnection
 
Players can leave a match at any time and reconnect later. Active matches are stored on the device
thanks to sqflite.

 - Forfeit
 
Players can forfeit a match. This immediately triggers a win condition for the opponent.

 - Move/Win/Challenge notification
 
Notifications are handled by Firebase Cloud Messaging. Every time a player is challenged, or an opponent plays a move, both players are notified.


If you want to use the online component, you can create a new Firebase project, 
create your own google-services.json and put it under android/app.

## Singleplayer

The app comes with a sqflite db of 500 combinations of target fields + game fields. A random 
combination is chosen.
"# Pixels-21-puzzle-game" 
"# Pixels-21-puzzle-game" 


## Pixels'21 Mini Event (GAP) Projects video
Our Beautiful Projects 🖤✨
https://www.facebook.com/625298947549642/videos/1105275009909763

## More Projects
for more projects in different enginneering fields, please visit our wevbsite:
https://pixelseg.com/project-contest
![Screenshot (149)](https://user-images.githubusercontent.com/80456446/124113398-b18b8a00-da6b-11eb-8faf-70db2402673c.png)


## Pixels App 
![187960930_3955292401216930_6844533153445761662_n](https://user-images.githubusercontent.com/80456446/124113684-00392400-da6c-11eb-8779-cea0193eefb6.jpg)

“Pixels Egypt” mobile app is considered an important and easy way to stay in touch with us.

The app will help you to:

- Browse different online courses and resources in different fields like Computer, Communication, Power, and Mechanical Engineering.
- You will find courses, videos, books and more.
- Follow our news.
- Share our knowledge.
- Be one of the family.

Get it now on Google Play:

https://play.google.com/store/apps/details


## Follow Pixels:

- Facebook:

https://www.facebook.com/PixelsEgyptOrg

- YouTube:

https://www.youtube.com/c/PixelsEgypt

- Instagram:

https://www.instagram.com/pixelsegypt/

- Twitter:

https://twitter.com/pixelsegypt?lang=en


