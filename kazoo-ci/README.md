# Kazoo CI

Continious integration server. Accepts Github webhooks and trigger commit-dependent build and test process.
Reports test results back to Github, and provides test run files.

# Build and test commit manually

```sh
docker exec -ti kazoo-ci ./build.sh 73fde591d5
```
