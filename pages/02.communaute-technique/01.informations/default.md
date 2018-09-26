---
title: Création d'un Job Jenkins
date: '2018-02-09 00:00:00 Z'
layout: post
description: Création d'un Job Jenkins
img: software-factory.jpg
author: Mehdi El Kouhen
---

Les jobs jenkins gérés pour le projet meltingpoc sont des jobs "Multibranch Pipeline". Voici les étapes de création des jobs.

# Création d'un Job Jenkins

* Se connecter à notre jenkins http://jenkins.k8.wildwidewest.xyz

* Cliquer sur "Nouveau item" (menu à gauche)

![Jenkins Job]({{ "/assets/images/new-job.png" | absolute_url }})

* Saisir le nom du projet à créer

* Cliquer sur "Multibranch Pipeline"

* Cliquer sur OK pour valider la création du Job

* Dans la configuration du Job, cliquer sur "Add source/GIT"

![Sources]({{ "/assets/images/add-source.png" | absolute_url }})

* Saisir l'URL GIT du Projet

![GIT]({{ "/assets/images/new-project-url.png" | absolute_url }})

* Cliquer sur Save en bas de page

# Création d'un Job MeltingPoc

Dans le cas particulier du projet meltingpoc, chaque projet a deux dépôts GIT :

* un dépôt contenant les sources du projet
* un dépôt contenant la configuration de déploiement

et deux Jobs associés :

* un job de compilation des sources du projet (et construction de l'image Docker)
* un job de déploiement

Dans le cas du projet api-gateway, nous avons

* un projet [api-gateway](https://github.com/SofteamOuest/api-gateway) contenant les sources du projet et un projet [api-gateway-run](https://github.com/SofteamOuest/api-gateway-run) pour le déploiement dans le kubernetes
* un job [api-gateway](http://jenkins.k8.wildwidewest.xyz/job/api-gateway/) de construction et un job [api-gateway-run](http://jenkins.k8.wildwidewest.xyz/job/api-gateway/) pour le déploiement


La structure des deux projets est décrite dans l'article [Déploiement Kubernetes]({{ site.baseurl }}{% post_url 2018-01-14-deploiement-kubernetes %})
