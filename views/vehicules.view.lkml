view: vehicules {
  sql_table_name: `sub-jms-gcp-for-looker.looker_formation.vehicules` ;;

  dimension: catv {
    type: number
    description: "Catégorie du véhicule :  00 – Indéterminable  01 – Bicyclette  02 – Cyclomoteur \u003c50cm3  03 – Voiturette  04 – scooter immatriculé 05 – motocyclette) 06 – side-car 07 – VL seul  08 – VL + caravane 09 – VL + remorque 10 – VU seul 1,5T \u003c= PTAC \u003c= 3,5T avec ou sans remorque (anciennement VU seul 1,5T \u003c= PTAC  \u003c= 3,5T)  11 – VU (10) + caravane 12 – VU (10) + remorque 13 – PL seul 3,5T \u003cPTCA \u003c= 7,5T  14 – PL seul \u003e 7,5T  15 – PL \u003e 3,5T + remorque  16 – Tracteur routier seul  17 – Tracteur routier + semi-remorque  18 – transport en commun 19 – tramway 20 – Engin spécial  21 – Tracteur agricole  30 – Scooter \u003c 50 cm3  31 – Motocyclette \u003e 50 cm3 et \u003c= 125 cm3  32 – Scooter \u003e 50 cm3 et \u003c= 125 cm3  33 – Motocyclette \u003e 125 cm3  34 – Scooter \u003e 125 cm3  35 – Quad léger \u003c= 50 cm3  36 – Quad lourd \u003e 50 cm3   37 – Autobus  38 – Autocar  39 – Train  40 – Tramway  41 – 3RM \u003c= 50 cm3  42 – 3RM \u003e 50 cm3 \u003c= 125 cm3  43 – 3RM \u003e 125 cm3  50 – EDP à moteur  60 – EDP sans moteur  80 – VAE  99 – Autre véhicule"
    sql: ${TABLE}.catv ;;
  }
  dimension: choc {
    type: number
    description: "Point de choc initial :  -1 – Non renseigné  0 – Aucun  1 – Avant  2 – Avant droit  3 – Avant gauche  4 – Arrière  5 – Arrière droit  6 – Arrière gauche  7 – Côté droit  8 – Côté gauche  9 – Chocs multiples (tonneaux)"
    sql: ${TABLE}.choc ;;
  }
  dimension: id_vehicule {
    type: string
    description: "Identifiant unique du véhicule repris pour chacun des usagers occupant ce véhicule (y compris les  piétons qui sont rattachés aux véhicules qui les ont heurtés) – Code numérique."
    sql: ${TABLE}.id_vehicule ;;
    primary_key: yes
  }
  dimension: manv {
    type: number
    description: "Manoeuvre principale avant l’accident :  -1 – Non renseigné  0 – Inconnue  1 – Sans changement de direction  2 – Même sens, même file  3 – Entre 2 files  4 – En marche arrière 5 – A contresens  6 – En franchissant le terre-plein central  7 – Dans le couloir bus, dans le même sens  8 – Dans le couloir bus, dans le sens inverse  9 – En s’insérant  10 – En faisant demi-tour sur la chaussée  Changeant de file  11 – A gauche  12 – A droite  Déporté  13 – A gauche  14 – A droite  Tournant  15 – A gauche  16 – A droite  Dépassant  17 – A gauche  18 – A droite  Divers  19 – Traversant la chaussée  20 – Manœuvre de stationnement  21 – Manœuvre d’évitement  22 – Ouverture de porte  23 – Arrêté (hors stationnement)  24 – En stationnement (avec occupants  25 – Circulant sur trottoir  26 – Autres manœuvres"
    sql: ${TABLE}.manv ;;
  }
  dimension: motor {
    type: number
    description: "Type de motorisation du véhicule :  -1 – Non renseigné  0 – Inconnue  1 – Hydrocarbures  2 – Hybride électrique  3 – Electrique  4 – Hydrogène  5 – Humaine  6 – Autre"
    sql: ${TABLE}.motor ;;
  }
  dimension: num_acc {
    type: number
    description: "Identifiant de l’accident identique à celui du fichier \"rubrique CARACTERISTIQUES\" repris pour chacun  des véhicules décrits impliqués dans l’accident."
    sql: ${TABLE}.Num_Acc ;;

  }
  dimension: num_veh {
    type: string
    description: "Identifiant du véhicule repris pour chacun des usagers occupant ce véhicule (y compris les piétons qui sont rattachés aux véhicules qui les ont heurtés) – Code alphanumérique."
    sql: ${TABLE}.num_veh ;;
  }
  dimension: obs {
    type: number
    description: "Obstacle fixe heurté :  -1 – Non renseigné  0 – Sans objet  1 – Véhicule en stationnement  2 – Arbre  3 – Glissière métallique  4 – Glissière béton  5 – Autre glissière  6 – Bâtiment, mur, pile de pont  7 – Support de signalisation verticale ou poste d’appel d’urgence  8 – Poteau  9 – Mobilier urbain  10 – Parapet  11 – Ilot, refuge, borne haute  12 – Bordure de trottoir  13 – Fossé, talus, paroi rocheuse  14 – Autre obstacle fixe sur chaussée  15 – Autre obstacle fixe sur trottoir ou accotement  16 – Sortie de chaussée sans obstacle  17 – Buse – tête d’aqueduc"
    sql: ${TABLE}.obs ;;
  }
  dimension: obsm {
    type: number
    description: "Obstacle mobile heurté :  -1 – Non renseigné  0 – Aucun  1 – Piéton  2 – Véhicule  4 – Véhicule sur rail  5 – Animal domestique  6 – Animal sauvage  9 – Autre"
    sql: ${TABLE}.obsm ;;
  }
  dimension: occutc {
    type: number
    description: "Nombre d’occupants dans le transport en commun."
    sql: ${TABLE}.occutc ;;
  }
  dimension: senc {
    type: number
    description: "Sens de circulation :  -1 – Non renseigné  0 – Inconnu  1 – PK ou PR ou numéro d’adresse postale croissant  2 – PK ou PR ou numéro d’adresse postale décroissant  3 – Absence de repère"
    sql: ${TABLE}.senc ;;
  }
  measure: count {
    type: count
  }
}
