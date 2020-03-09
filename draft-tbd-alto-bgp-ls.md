---
docname: draft-tbd-alto-bgp-ls-latest
title: Considerations of Providing ALTO Services using BGP-LS
abbrev: ALTO using BGP-LS
category: std

ipr: trust200902
area: Networks
workgroup: ALTO WG
keyword: ALTO, Internet-Draft

stand_alone: yes
pi:
  strict: yes
  comments: yes
  inline: yes
  editing: no
  toc: yes
  tocompact: yes
  tocdepth: 3
  iprnotified: no
  sortrefs: yes
  symrefs: yes
  compact: yes
  subcompact: no

author:
 -
    ins: LM. Contreras
    name: Luis M. Contreras
    organization: Telefonica
    email: luismiguel.contrerasmurillo@telefonica.com
    street: Ronda de la Comunicacion, s/n
    city: Madrid
    code: 28050
    country: Spain
 -
    ins: J. Zhang
    name: Jingxuan Jensen Zhang
    organization: Tongji University
    email: jingxuan.zhang@tongji.edu.cn
    street: 4800 Cao'An Hwy
    city: Shanghai
    code: 201804
    country: China
 -
    ins: K. Gao
    name: Kai Gao
    street: No.24 South Section 1, Yihuan Road
    city: Chengdu
    code: 610000
    country: China
    org: Sichuan University
    email: kaigao@scu.edu.cn

normative:
  RFC2119:
  RFC4271:
  RFC7285:
  RFC7752:
  RFC7971:
  RFC8571:
informative:
  RFC8189:
  I-D.ietf-alto-path-vector:
  I-D.ietf-alto-unified-props-new:
  I-D.ietf-alto-cost-calendar:
  I-D.ietf-alto-incr-update-sse:
  I-D.wang-idr-bgpls-inter-as-topology-ext:

--- abstract

This document discusses the requirements and deployment considerations of
providing Application-Layer Traffic Optimization (ALTO) information in the
inter-domain scenario using Border Gateway Protocol - Link State (BGP-LS)
extension.


--- note_Requirements_Language

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD",
"SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be
interpreted as described in {{RFC2119}}.

--- middle

{::include introduction.md}

{::include background.md}

{::include requirement.md}

{::include consideration.md}

{::include example.md}

--- back

{::include appendix.md}
