# Background

## ALTO Inter-domain Deployment Problem

{{RFC7971}} discusses considerations of ALTO deployment in different network
scenarios. The inter-domain network is the most common scenario to deploy
ALTO. In practice, the following approaches are used to collect information from
the network:

- Interior Gateway Protocols (IGPs, e.g., OSPF, IS-IS): intra-domain topology, link weights
- Border Gateway Protocol (BGP): inter-domain topology, prefixes, AS numbers, AS distances, or other BGP metrics
- Network Management Protocols (NMPs, e.g., SNMP, Netconf): latency, utilization, bandwidth

## BGP-LS Background and Benefits for ALTO

BGP-LS {{RFC7752}} is designed to allow a BGP speaker to advertise the link state
database (LSDB) or traffic engineering database (TED) of its connected IGP
area. BGP-LS defines a new address family, link state, in the BGPv4 framework {{RFC4271}}.
Using BGP-LS, the ALTO server can communicate to only BGP speakers to collect
all those information.

## ALTO Deployment Problem using BGP-LS

A simple deployment solution is to connect the ALTO server as a BGP reflector
client of every BGP speaker in the network. However, this solution is
expensive and redundant. Further, because of the asynchronous nature of BGP 
updates, the ALTO server could receive redundant and inconsistent 
information. To avoid the redundancy and inconsistency of the collected 
information, a deployment solution should be minimal.

To understand what is a minimal solution to deploy ALTO using BGP-LS, the
following questions are raised:

- Is it necessary to connect the ALTO server to every AS within a BGP session?
- Does the session between the ALTO server and each AS have to enable BGP-LS?
- If using BGP-LS, can the number of necessary BGP sessions be reduced?

As an example of minimal deployment, consider the following AS-level topology. 
Assuming all the BGP sessions between ASes have enabled BGP-LS, the BGP speaker on AS B can
received the IGP topologies from all the three ASes. Thus, to make sure the
ALTO server collect all the inter-domain and intra-domain topology
information, the minimal deployment could be to set up the the ALTO server as
a BGP reflector of the BGP speaker on AS B.

~~~
+--------+   +--------+   +---------+
| AS A   |---| AS B   |---| AS C    |
+--------+   +--------+   +---------+
     | BGP     / BGP-LS
     |        /
     |       /
+-------------+
| ALTO Server |
+-------------+
~~~
{: #fig-topo title="Example AS-level Topology"}

However, it is not enough for collecting the routing information. As BGP
is a destination-based routing protocol, AS B could not receive the routing
information between endpoints from AS A and AS C. To get the missing routing
information, the ALTO server should also read the BGP RIB of AS A or
AS C at least. As theA result, the minimal solution is to establish a BGP 
session to AS B with BGP-LS and another BGP session to AS A (or AS C) without BGP-LS.

The following part of this document will discuss how to achieve the minimal
ALTO deployment using BPG-LS in detail. Specifically, two questions are
required to be answered:

- Which BGP speakers are required to be connected to the ALTO server?
- Which BGP sessions are required to enable BGP-LS?