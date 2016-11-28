# Here is what I want to have in the end:

1. A build server that builds Docker images nightly, and publishes them to Docker Hub if they pass tests.
2. A dedicated page how to setup Kazoo and MakeBusy in Docker environment to start writing tests
3. A dedicated page how to setup MakeBusy and do tests on existing Kazoo cluster
4. Github PR integration (on each PR run test suite and report results back, probably on the same server from p.1)
5. Public MakeBusy Callflow repository (to reference examples)
6. A dedicated page how to setup Kazoo cluster from Docker images, with examples:
	1. A basic setup in one Docker network, with external ip traffic forwarded to appropriate instances
	2. A basic setup with two Docker hosts interconnected
	3. Clustering setup (not so sure atm what it should be)

# What I have already:

1. Designated Linode server 
2. A pipeline (more or less) to build dev Docker images and production Docker images from dev ones
3. Repeatable MakeBusy output

# What is good to have:

1. A web-ui to MakeBusy allowing to write (and execute) tests real-time. Probably against existing Kazoo installations
(given admin credentials and access provided).  
