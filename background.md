# Background

## BGP-LS Background and Benefits for ALTO

BGP-LS is designed to allow a BGP speaker to advertise the link state
database (LSDB) or traffic engineering database (TED) of its connected IGP
area.

## ALTO Inter-domain Deployment Problem using BGP-LS

{{RFC7971}} discusses considerations of ALTO deployment in different network
scenarios. The inter-domain network is the most common scenario to deploy
ALTO.

In practice, the following approaches are used to collect information from
the network:

- IGP (e.g., OSPF, IS-IS): intra-domain topology, link weights
- BGP: inter-domain topology, prefixes, AS numbers, AS distances, or other BGP metrics
- MP (e.g., SNMP, Netconf): latency, utilization, bandwidth

Using BGP-LS, the ALTO server can communicate to only BGP speakers to collect
all those information.

Qestions (by Anais):

- Is it necessary to connect the ALTO server to every AS within a BGP session?
- Does the session between the ALTO server and each AS have to enable BGP-LS?
- If using BGP-LS, can the number of necessary BGP sessions be reduced?

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

Why not communicate to every BGP speaker?

- Expensive workload
- 