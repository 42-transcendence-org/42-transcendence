- TODO Split game and user management in different apps
- TODO 	Implement async views
- TODO User SSE
- TODO User client side prediction and interpolation
- Create function decorators to check if a user is part of a game
Add a way to save all game states to the db when server quits


CamelCase for classes
snake_case for variables and functions
ALL_CAPS for constants


https://redis.io/docs/management/optimization/benchmarks/

When the server and client benchmark programs run on the same box, both the
TCP/IP loopback and unix domain sockets can be used. Depending on the
platform, unix domain sockets can achieve around 50% more throughput than
the TCP/IP loopback (on Linux for instance). The default behavior of
redis-benchmark is to use the TCP/IP loopback.


Client-Side Prediction and Interpolation: Implement client-side prediction where the client predicts the game state based on the last known state and the player's inputs. This can reduce the dependency on the server for real-time updates. Additionally, interpolation can be used to smooth out the rendering between received states.

State Delta Updates: Instead of sending the entire game state on each update, send only the changes or deltas. This reduces the amount of data transferred per update, decreasing the load on the server and network.
Asynchronous Processing: Ensure that your server handles requests asynchronously, allowing it to manage multiple connections without blocking.
