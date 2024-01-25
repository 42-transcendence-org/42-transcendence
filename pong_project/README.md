- TODO Split game and user management in different apps

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
