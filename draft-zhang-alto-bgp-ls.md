---
docname: draft-zhang-alto-bgp-ls-latest
title: Considerations of Deploying ALTO using BGP - Link State (BGP-LS) Advertisement
abbrev: ALTO using BGP-LS
category: info

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
    ins: A. Escribano
    name: Anais Escribano
    organization: Alten
    email: anais.escribano@alten.es
    street: Carrer de Josep Pla, 2
    city: Barcelona
    code: 08019
    country: Spain
 -
    ins: P. Cano
    name: Patricia Cano
    organization: UST Global
    email: Patricia.Diez@ust-global.com
    street: Ramirez de Arellano 29
    city: Madrid
    code: 28043
    country: Spain
 -
    ins: F. Cano
    name: Francisco Cano
    organization: Telefonica
    email: franciscojose.canohila@telefonica.com
    street: Avenida del Conocimiento, 12
    city: Granada
    code: 18016
    country: Spain

normative:
  RFC2119:
  RFC4271:
  RFC7285:
  RFC7752:
  RFC7971:
  RFC8174:
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
"SHOULD NOT", "RECOMMENDED", "NOT RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in BCP 14 {{RFC2119}} {{RFC8174}}
when, and only when, they appear in all capitals, as shown here. When the words
appear in lower case, they are to be interpreted with their natural language
meanings.

--- middle

{::include introduction.md}

{::include new-design.md}

{::include background.md}

{::include requirement.md}

{::include consideration.md}

{::include example.md}

--- back

{::include appendix.md}
