view: accidents {
  sql_table_name: `looker_formation.accidents` ;;

  dimension: age_vehicule {
    type: string
    description: "Age du véhicule à partir de la date de 1ère mise en circulation jusqu’à la date de l’accident."
    sql: ${TABLE}.Age_vehicule ;;
  }
  dimension: annee {
    type: number
    description: "Année de l'accident"
    sql: ${TABLE}.annee ;;
  }
  dimension: categorie_vehicule {
    type: string
    description: " Cyclo : Cyclomoteur \u003c50cm3, Scooter \u003c 50 cm3 , 3RM \u003c= 50 cm3  Moto légère : Motocyclette \u003e 50 cm3 et \u003c= 125 cm3 , Scooter \u003e 50 cm3 et \u003c= 125 cm3 , 3RM \u003e 50  cm3 \u003c= 125 cm3  Moto lourde : Motocyclette \u003e 125 cm3 , Scooter \u003e 125 cm3 , 3RM \u003e 125 cm3  VT : Véhicule de tourisme ou véhicule léger seul  VU : Véhicule utilitaire seul 1,5T \u003c= PTAC \u003c= 3,5T avec ou sans remorque   PL : PL seul 3,5T \u003cPTCA \u003c= 7,5T, PL seul \u003e 7,5T, PL \u003e 3,5T + remorque, Tracteur routier seul,  Tracteur routier + semi-remorque  Autres : Autobus, Autocar, Train, Tramway, Quad léger \u003c= 50 cm3 (Quadricycle à moteur non  carrossé), Quad lourd \u003e 50 cm3 (Quadricycle à moteur non carrossé), Tracteur agricole,  Voiturette (Quadricycle à moteur carrossé) (anciennement \"voiturette ou tricycle à moteur\"),  Engin spécial, Autre véhicule"
    sql: ${TABLE}.Categorie_vehicule ;;
  }
  dimension: cnit {
    type: string
    description: "En 1994, lors de la mise en place du fichier national des immatriculations, un numéro d’identification  national (CNIT) a été associé à chaque type, variante et version (TVV) de chaque réception  communautaire de véhicules. A partir de 1996, le CNIT compte 12 caractères, depuis 2009, il en  compte 15. Dans la liste, pour certains véhicules, le code CNIT n'est pas connu et prend la valeur \"N/A\"."
    sql: ${TABLE}.CNIT ;;
  }
  dimension: id_accident {
    type: string
    description: "Numéro d'identifiant de l’accident."
    sql: ${TABLE}.Id_accident ;;
  }
  dimension: lettre_conventionnelle_vehicule {
    type: string
    description: "Identifiant de chaque véhicule impliqué dans un même accident – Code alpha. Les lettres sont  uniques au sein de l’accident mais pas au sein de la liste complète. L’ordre des lettres n’a pas de  signification."
    sql: ${TABLE}.Lettre_Conventionnelle_Vehicule ;;
  }
  dimension: lieu_admin_actuele_territoire_nom {
    type: string
    description: "Agrégat géographique permettant d’identifier si l’accident a eu lieu en « Métropole » (France  métropolitaine), dans les « DOM » (Guadeloupe, Martinique, Guyane, La Réunion, Mayotte), ou dans  les « Autres OM » (Saint-Barthélemy, Saint-Martin, Saint-Pierre-et-Miquelon, Nouvelle-Calédonie,  Polynésie française, Wallis-et-Futuna)."
    sql: ${TABLE}.Lieu_Admin_Actuele_Territoire_Nom ;;
  }
  dimension: type_accidente_libeller {
    type: string
    description: " Un accident léger est un accident corporel comptant au moins un blessé léger (hospitalisé moins  de 24h), aucun blessés hospitalisés (plus de 24h) et aucun tué (jusqu'à 30 jours après  l'accident).  Un accident grave non mortel est un accident corporel comptant au moins un blessé hospitalisé  (plus de 24h) et aucun tué (jusqu'à 30 jours après l'accident).  Un accident mortel est un accident corporel comptant au moins un tué (jusqu'à 30 jours après  l'accident). Ex : un accident comptant 1 blessé léger et 2 blessés hospitalisés, est un accident grave non mortel"
    sql: ${TABLE}.Type_Accidente_Libeller ;;
  }
  measure: count {
    type: count
  }
}
