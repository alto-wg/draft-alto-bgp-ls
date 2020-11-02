# New Problem Statement and Working Items

This document was initially written to summarize ALTO deployment
consideration using BGP-LS. However, authors are finding new interesting
practical problems when pushing the deployment to large-scale ISP networks.

Authors identify two problems:

Problem 1: how to efficiently obtain fine-grained global ALTO information
from multiple networks?

Problem 2: how to efficiently reconstruct and disseminate the ALTO
information upon dynamics?

Considering the scale of the ISP carrier networks and the frequency of
network dynamicity, the previous design cannot survive. We have to target a
systemtic design to support (1) distributed information collection, and
(2) calculation and incremental information recomputation.

Thus, authors propose a hierarchical architecture to deploy ALTO servers. To
make the deployment in different small networks compatible with each other,
the interfaces to allow interoperations between different ALTO servers are
required. Although we can design and implement those interfaces outside the
scope of ALTO, we believe making ALTO provide this capability by itself can
be a more coherent approach and also have more potential benefits.

We are still heavily working on the initial specification. No more details
are added in the current document. But we have already done a paper
submission to talk about the initial design. For people interested in this
work, please feel free to contact us.
