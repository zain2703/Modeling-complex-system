# Modeling-complex-system
Creating a adjacent matrix for keeping the connection of every new websites with different probability functions.
Consider the following model of linking between websites. The world wide
web initially consists of n = 100 websites all of which have a single link to
itself (this can be thought of as a self-link). On each day t, a new website
is created which links the new site to m already established sites using the
following rule for each link
 With probability p the linked site chosen is completely at random, i.e.
all sites are equally likely to be chosen.
 With probability 1-p the linked site is chosen in proportion to the
number of links it already has. So that if a site i with has Ki links

Specically, create a (T +N)(T +N) matrix
which contains a 1 if there is a link between two sites and 0 otherwise.
Once you have created the network investigate its connectivity and its
robustness to attack. We say that two sites are weakly connected if
there exists some sequence of links that when followed end up at the
same site.

Investigate two types of attacks on the network. One in which 100 ran-
dom sites are removed from the network, so all their links are removed,
another in which the 100 most popular sites. Investigate how the size
of the largest connected component changes after each of these attacks,
and how this depends on p and m. Which types of networks remain
connected after an attack?
