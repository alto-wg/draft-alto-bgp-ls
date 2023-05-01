# Introduction

A major component of the Application-Layer Traffic Optimization (ALTO)
{{RFC7285}} deployment is the network information collection. {{RFC7971}}
discusses multiple options to collect the network information from the
inter-domain networks. To collect the related network information for ALTO, 
the following high-level questions should be considered:

- Can the ALTO service realistically discover such information?
- Is the exposure of such information allowed by the operators of that
  service?
- Does it provide information that a client cannot find easily by using 
some other way?

The Border Gateway Protocol - Link State (BGP-LS) extension {{RFC7752}} is
one of the popular options and has been deployed in many Autonomous Systems
(ASes) in recent years [TODO: Need some reference]. BGP-LS enables ALTO servers 
to provide underlay inter-domain topology information using the link-state 
information in IGP domains.

To leverage BGP-LS and generate ALTO information effectively, some
requirements for deployment should be considered. This document discusses 
these requirements and the corresponding deployment
considerations. Additionally, this document describes some inter-domain 
scenarios to test the deployment.