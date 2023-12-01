view: caracteristiques {
  sql_table_name: `sub-jms-gcp-for-looker.looker_formation.caracteristiques` ;;

  dimension: adr {
    type: string
    description: "Adresse postale : variable renseignée pour les accidents survenus en agglomération."
    sql: ${TABLE}.adr ;;
  }
  dimension: agg {
    type: number
    description: "Localisation :  1 – Hors agglomération  2 – En agglomération"
    sql: ${TABLE}.agg ;;
  }
  dimension: an {
    type: number
    description: "Année de l'accident."
    sql: ${TABLE}.an ;;
  }
  dimension: atm {
    type: number
    description: "Conditions atmosphériques :  -1 – Non renseigné  1 – Normale  2 – Pluie légère  3 – Pluie forte  4 – Neige - grêle  5 – Brouillard - fumée  6 – Vent fort - tempête  7 – Temps éblouissant  8 – Temps couvert  9 – Autre"
    sql: ${TABLE}.atm ;;
  }
  dimension: col {
    type: number
    description: "Type de collision :  -1 – Non renseigné  1 – Deux véhicules - frontale  2 – Deux véhicules – par l’arrière  3 – Deux véhicules – par le coté  4 – Trois véhicules et plus – en chaîne  5 – Trois véhicules et plus - collisions multiples  6 – Autre collision  7 – Sans collision"
    sql: ${TABLE}.col ;;
  }
  dimension: com {
    type: string
    description: "Commune : Le numéro de commune est un code donné par l‘INSEE. Le code est composé du code  INSEE du département suivi par 3 chiffres."
    sql: ${TABLE}.com ;;
  }
  dimension: dep {
    map_layer_name: departement_france
    type: string
    description: "Département : Code INSEE (Institut National de la Statistique et des Etudes Economiques) du  département (2A Corse-du-Sud – 2B Haute-Corse)."
    sql: ${TABLE}.dep ;;
  }
  dimension: hrmn {
    type: string
    description: "Heure et minutes de l'accident."
    sql: ${TABLE}.hrmn ;;
  }
  dimension: int {
    type: number
    description: "Intersection :  1 – Hors intersection  2 – Intersection en X  3 – Intersection en T  4 – Intersection en Y  5 – Intersection à plus de 4 branches  6 – Giratoire  7 – Place  8 – Passage à niveau  9 – Autre intersection"
    sql: ${TABLE}.int ;;
  }
  dimension: jour {
    type: number
    description: "Jour de l'accident"
    sql: ${TABLE}.jour ;;
  }
  dimension: lat {
    type: number
    description: "Latitude"
    sql: ${TABLE}.lat ;;
  }
  dimension: long {
    type: number
    description: "Longitude"
    sql: ${TABLE}.long ;;
  }
  dimension: lum {
    type: number
    description: "Lumière : conditions d’éclairage dans lesquelles l'accident s'est produit :  1 – Plein jour  2 – Crépuscule ou aube  3 – Nuit sans éclairage public  4 – Nuit avec éclairage public non allumé  5 – Nuit avec éclairage public allumé"
    sql: ${TABLE}.lum ;;
  }
  dimension: mois {
    type: number
    description: "Mois de l'accident."
    sql: ${TABLE}.mois ;;
  }
  dimension: num_acc {
    type: number
    description: "Numéro d'identifiant de l’accident."
    sql: ${TABLE}.Num_Acc ;;
    primary_key: yes
  }
  measure: count {
    type: count
  }
}
