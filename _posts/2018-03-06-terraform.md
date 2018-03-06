---
layout: post
title: Terraform
date: 2018-03-06
description: Terraform
img: software-factory.jpg # Add image post (optional)
author: Victor SALAUN
---

[Terraform](https://www.terraform.io/) est un outil d’infrastructure as code, multi-providers, open source, édité par [Hashicorp](https://www.hashicorp.com/).
Il permet de créer et modifier ses infrastructures et environements sous la forme de fichiers de configuration de manière prévisible.
Le principal concept se base sur l’état de la cible, il s’agit donc d’une approche d’infrastructure immutable.


Avantages :
* Est devenu un standard
* Large communauté
* Support multi-provides assuré dont AWS, Azure, GCE
* Reproductibilité via des modules


Inconvénients :
* Pas d’interface centralisée
* Nécessité de développer
* En fonction du provider, pas tous les services ne sont couverts

La création de modules permet de centraliser les usages et d’assurer une bonne réutilisabilité des modèles d’infrastructures par les équipes
