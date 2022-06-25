# Racket Reel

Share the live score of your tennis matches online by keeping scoring on a wearable or mobile device.

Upcoming features

- Overlay this score on a video live stream of your match
- Enable the score overlay when playing back old live streams

To request features raise GitHub issues against this project.

## Source Index

- [Services](src/Services/)
    - [Matches](src/Services/Matches/) is a REST service to configure and score matches
    - (todo) MatchStateStreaming is a SignalR service to stream match states to clients
- [Web](src/Web/) is a web client to watch matches live or replay old matches
- (todo) Mobile is a mobile client to configure and score matches
