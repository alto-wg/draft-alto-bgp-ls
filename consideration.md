# ALTO Deployment Considerations using BGP-LS

This section discusses some deployment considerations about how to address
the basic requirements (Req 1-3) when satisfying the BGP-LS specific
requirements (Req 4-5).

## Provisioning of Topology Information

As BGP-LS advertisements cannot be propagated to remote ASes, each
BGP speaker can only discover directly peered IGP topologies using BGP-LS.

To satisfy Req 4, the ALTO server should only communicate to transit networks
or IXPs using BGP-LS. As the IGP topology of a stub network can always be
discovered by its peered transit networks or IXPs, it is not necessary to
communicate with the stub network.

Specifically, the ALTO server should find a minimal BGP speaker set whose
peered networks can cover all IGP domains.

## Provisioning of Routing Information

As BGP is a destination-based routing protocol, a stub network can receive
all the inter-domain routing information from all the reachable destinations
via BGP. Thus, to satisfy Req 4, the ALTO server should only communicate to stub networks
using BGP, as the inter-domain routing information from the transit networks is
not necessary.

Assuming the ALTO server has already collected the complete topology
information using BGP-LS, the ALTO server will have the LSDB of every IGP
domain. To satisfy Req 5, all the BGP sessions connected to the stub networks do not
have to enable BGP-LS.

## Provisioning of Performance Metric Information

TBD.

# Configuration Interfaces of Map Calculation

## Configuration Interface of Network Map Calculation

~~~
rw network-map-config* [resource-id]
+--rw resource-id      alto-types:resource-id
+--rw description?     string
+--rw (params)
|  +--:(bgp)
|     +--rw bgp-params
|        +--rw bgp-rib* [rib-id]
|           +--rw rib-id       rib:rib-id
|           +--rw topology-id? topology:topology-id
|           +--rw bgp-ls?      boolean
+--rw (algorithm)
   +--:(first-hop-cluster)
      +--rw first-hop-cluster-algorithm
         +--rw inspect-igp     boolean
~~~

To generate a network map, one or more BGP RIBs that could provide the
topology information MUST be specified. Each BGP RIB MAY include a pre-computed
topology from the RIB, and an option indicating if the BPG-LS is enabled.

The `inspect-igp` option in the `first-hop-cluster-algorithm` field indicates
if the ALTO server exposes information about the IGP topologies. If it is
true, the ALTO server will inspect all the IGP topologies from the BGP RIBs
that enable BGP-LS (i.e., whose `bgp-ls` option is true).

## Configuration Interface of Cost Map Calculation

~~~
rw cost-map-config* [resource-id]
+--rw resource-id              alto-types:resource-id
+--rw description?             string
+--rw dependent-network-map    alto-types:resource-id
+--rw (general-params)
|  +--:(bgp)
|     +--rw bgp-params
|        +--rw alternative-bgp-rib* [rib-id]
|           +--rw rib-id            rib:rib-id
|           +--rw topology-id?      topology:topology-id
|           +--rw bgp-ls?           boolean
+--rw cost-type* [cost-mode,cost-metric]
   +rw cost-mode                    alto-types:cost-mode
   +rw cost-metric                  alto-types:cost-metric
   +rw (params)?
~~~

To generate a cost map, besides the dependent network map, one or more
alternative BGP RIBs could be specified to provide necessary routing
information to the ALTO server.

## Configuration Examples

Example Network:

~~~
.----------------------------.                    .------------.
| 1.1.1.0/24    6.6.6.0/24   |                    | 8.8.8.0/24 |
|     |             |        |                    |     |      |
|   +-+--+        +-+--+     |                    |   +-+--+   |
|   | R1 +--------+ R6 |     |    .------------.  |   | R8 |   |
|   +-+--+        +-+--+     |    | 3.3.3.0/24 |  |   +-+--+   |
|     |             |        |    |    |       |  |     |      |
|     |           +-+--+     |    |  +-+--+    |  |   +-+--+   |
|     +-----------+ R2 +- - -|- - | -+ R3 +- - | -|- -+ R7 |   |
|                 +----+     |    |  +++--+    |  |   +----+   |
|                   |        |    |   ..       |  |            |
|                 +-+--+     |    |   ..AS 200 |  |     AS 300 |
| 5.5.5.0/24------+ R5 |     |    `------------'  `------------'
|                 +-+--+     |        ..
|                   |        |        ..
|   AS 100        +-+--+     |        ..
|                 | R4 +- - -|- - - - +.
|                 +-+--+     |         .
`----------------------------'         .
                    .                  .
                    .                  .
                    .         +--------+----+
                    +- - - - -+ ALTO Server |
                              +-------------+

R2 - R3: BGP-LS
R4 - R3: BGP-LS
R7 - R3: BGP-LS
R3 - ALTO: BGP-LS
R4 - ALTO: BGP
~~~
{: #fig-example-network Example Network}

Config a network map:

~~~
POST /restconf/config/alto-maps/network-map-config/bgp-networkmap
HOST: alto-config.example.com
Content-Type: application/json
Content-Length: TBD

{
  "network-map-config": {
    "resource-id": "bgp-networkmap",
    "bgp-params": {
      "bgp-rib": [
        {
          "rib-id": "as200-r3",
          "bgp-ls": true
        }
      ]
    },
    "first-hop-cluster-algorithm": {
      "inspect-igp": true
    }
  }
}
~~~

Test to fetch the network map:

~~~
GET /alto/networkmap/example
HOST: alto.example.com

HTTP/1.1 200 OK
Content-Length: TBD
Content-Type: application/alto-networkmap+json

{
  "meta": {
    "vtag": {
      "resource-id": "bgp-networkmap",
      "tag": "da65eca2eb7a10ce8b059740b0b2e3f8eb1d4785"
    }
  },
  {
    "network-map": {
      "PID100.R1": {
        "ipv4": [ "1.1.1.0/24" ]
      },
      "PID100.R5": {
        "ipv4": [ "5.5.5.0/24" ]
      },
      "PID100.R6": {
        "ipv4": [ "6.6.6.0/24" ]
      },
      "PID200.R3": {
        "ipv4": [ "3.3.3.0/24" ]
      },
      "PID300.R8": {
        "ipv4": [ "8.8.8.0/24" ]
      }
    }
  }
}
~~~

Config a cost map:

~~~
POST /restconf/config/alto-maps/cost-map-config/bgp-costmap
HOST: alto-config.example.com
Content-Type: application/json
Content-Length: TBD

{
  "cost-map-config": {
    "resource-id": "bgp-costmap",
    "dependent-network-map": "bgp-networkmap",
    "bgp-params": {
      "alternative-bgp-rib": [
        {
          "rib-id": "as100-r4",
          "bgp-ls": false
        }
      ]
    },
    "cost-type": [
      {
        "cost-mode": "numerical",
        "cost-metric": "hopcount"
      }
    ]
  }
}
~~~

Test to fetch the cost map:

~~~
GET /alto/costmap/bgp-costmap
HOST: alto.example.com

HTTP/1.1 200 OK
Content-Length: TBD
Content-Type: application/alto-costmap+json

{
  "meta": {
    "vtag": {
      "resource-id": "bgp-costmap",
      "tag": "c0ce023b8678a7b9ec00324673b98e54656d1f6d"
    },
    "dependent-vtags": [
      {
        "resource-id": "bgp-networkmap",
        "tag": "da65eca2eb7a10ce8b059740b0b2e3f8eb1d4785"
      }
    ],
    "cost-type": {
      "cost-mode": "numerical",
      "cost-metric": "hopcount"
    }
  },
  "cost-map": {
    "PID100.R1": {
      "PID100.R1": 1, "PID100.R5": 3, "PID100.R6": 2,
      "PID200.R3": 3, "PID300.R8": 5
    },
    "PID100.R5": {
      "PID100.R1": 3, "PID100.R5": 1, "PID100.R6": 3,
      "PID200.R3": 3, "PID300.R8": 5
    },
    "PID100.R6": {
      "PID100.R1": 2, "PID100.R5": 3, "PID100.R6": 1,
      "PID200.R3": 3, "PID300.R8": 5
    },
    "PID200.R3": {
      "PID100.R1": 3, "PID100.R5": 3, "PID100.R6": 3,
      "PID200.R3": 1, "PID300.R8": 3
    },
    "PID300.R8": {
      "PID100.R1": 5, "PID100.R5": 5, "PID100.R6": 5,
      "PID200.R3": 3, "PID300.R8": 1
    }
  }
}
~~~