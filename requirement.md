# Requirements for Deploying ALTO in the Inter-domain Scenario using BGP-LS

## Basic Requirements

The following basic requirements are required by ALTO inter-domain deployment in any case.

Req 1: The ALTO server MUST be able to collect topology information from
multiple IGP areas.

Req 2: The ALTO server MUST be able to collect routing information for any pairs of endpoints.

Req 3: The ALTO server MUST be able to collect performance metrics across routes.

## BGP-LS specific Requirements

The following additional requirements are required by ALTO deployment when using BGP-LS.

Req 4: The ALTO server SHOULD only communicate with necessary BGP speakers.

Req 5: The ALTO server SHOULD only enable BGP-LS advertisement in necessary BGP sessions between BGP speakers.