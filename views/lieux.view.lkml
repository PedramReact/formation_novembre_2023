view: lieux {
  sql_table_name: `looker_formation.lieux` ;;

  dimension: catr {
    type: number
    description: "Catégorie de route :  1 – Autoroute  2 – Route nationale  3 – Route Départementale  4 – Voie Communales  5 – Hors réseau public  6 – Parc de stationnement ouvert à la circulation publique  7 – Routes de métropole urbaine  9 – autre"
    sql: ${TABLE}.catr ;;
  }
  dimension: circ {
    label: "Régime de circulation"
    type: number
    description: "Régime de circulation :  -1 – Non renseigné  1 – A sens unique  2 – Bidirectionnelle  3 – A chaussées séparées  4 – Avec voies d’affectation variable"
    sql: ${TABLE}.circ ;;
  }
  dimension: infra {
    type: number
    description: "Aménagement - Infrastructure :  -1 – Non renseigné  0 – Aucun  1 – Souterrain - tunnel  2 – Pont - autopont  3 – Bretelle d’échangeur ou de raccordement  4 – Voie ferrée  5 – Carrefour aménagé  6 – Zone piétonne  7 – Zone de péage  8 – Chantier  9 – Autres"
    sql: ${TABLE}.infra ;;
  }
  dimension: larrout {
    type: number
    description: "Largeur de la chaussée affectée à la circulation des véhicules ne sont pas compris les bandes d'arrêt  d'urgence, les TPC et les places de stationnement (en m)"
    sql: ${TABLE}.larrout ;;
  }
  dimension: lartpc {
    type: number
    description: "Largeur du terre-plein central (TPC) s'il existe (en m)."
    sql: ${TABLE}.lartpc ;;
  }
  dimension: nbv {
    type: number
    description: "Nombre total de voies de circulation."
    sql: ${TABLE}.nbv ;;
  }
  dimension: num_acc {
    type: number
    description: "Identifiant de l’accident identique à celui du fichier \"rubrique CARACTERISTIQUES\" repris dans l’accident."
    sql: ${TABLE}.Num_Acc ;;
  }
  dimension: plan {
    type: number
    description: "Tracé en plan :  -1 – Non renseigné  1 – Partie rectiligne  2 – En courbe à gauche  3 – En courbe à droite  4 – En « S »"
    sql: ${TABLE}.plan ;;
  }
  dimension: pr {
    type: number
    description: "Numéro du PR de rattachement (numéro de la borne amont). La valeur -1 signifie que le PR n’est pas  renseigné."
    sql: ${TABLE}.pr ;;
  }
  dimension: pr1 {
    type: number
    description: "Distance en mètres au PR (par rapport à la borne amont). La valeur -1 signifie que le PR n’est pas  renseigné"
    sql: ${TABLE}.pr1 ;;
  }
  dimension: prof {
    type: number
    description: "Profil en long décrit la déclivité de la route à l'endroit de l'accident :  -1 – Non renseigné  1 – Plat  2 – Pente  3 – Sommet de côte  4 – Bas de côte"
    sql: ${TABLE}.prof ;;
  }
  dimension: situ {
    type: number
    description: "Situation de l’accident :  -1 – Non renseigné  0 – Aucun  1 – Sur chaussée  2 – Sur bande d’arrêt d’urgence  3 – Sur accotement  4 – Sur trottoir  5 – Sur piste cyclable  6 – Sur autre voie spéciale  8 – Autres"
    sql: ${TABLE}.situ ;;
  }
  dimension: surf {
    type: number
    description: "Etat de la surface :  -1 – Non renseigné  1 – Normale  2 – Mouillée  3 – Flaques  4 – Inondée  5 – Enneigée  6 – Boue  7 – Verglacée  8 – Corps gras – huile  9 – Autre"
    sql: ${TABLE}.surf ;;
  }
  dimension: v1 {
    type: number
    description: "Indice numérique du numéro de route (exemple : 2 bis, 3 ter etc.)."
    sql: ${TABLE}.v1 ;;
  }
  dimension: v2 {
    type: string
    description: "Lettre indice alphanumérique de la route."
    sql: ${TABLE}.v2 ;;
  }
  dimension: vma {
    type: number
    description: "Vitesse maximale autorisée sur le lieu et au moment de l’accident."
    sql: ${TABLE}.vma ;;
  }
  dimension: voie {
    type: string
    description: "Numéro de la route."
    sql: ${TABLE}.voie ;;
  }
  dimension: vosp {
    type: number
    description: "Signale l’existence d’une voie réservée, indépendamment du fait que l’accident ait lieu ou non sur  cette voie.  -1 – Non renseigné  0 – Sans objet  1 – Piste cyclable  2 – Bande cyclable  3 – Voie réservée"
    sql: ${TABLE}.vosp ;;
  }
  measure: count {
    type: count
  }
}
