view: usagers_accident {
  sql_table_name: `sub-jms-gcp-for-looker.looker_formation.usagers` ;;

  dimension: actp {
    type: string
    description: "Action du piéton :  -1 – Non renseigné  Se déplaçant  0 – Non renseigné ou sans objet  1 – Sens véhicule heurtant  2 – Sens inverse du véhicule  Divers  3 – Traversant  4 – Masqué  5 – Jouant – courant  6 – Avec animal  9 – Autre  A – Monte/descend du véhicule  B – Inconnue"
    sql: ${TABLE}.actp ;;
  }
  dimension: an_nais {
    type: number
    description: "Année de naissance de l'usager."
    sql: ${TABLE}.an_nais ;;
  }
  dimension: catu {
    type: number
    description: "Catégorie d'usager :  1 – Conducteur  2 – Passager  3 – Piéton"
    sql: ${TABLE}.catu ;;
  }
  dimension: etatp {
    type: number
    description: "Cette variable permet de préciser si le piéton accidenté était seul ou non :  -1 – Non renseigné  1 – Seul  2 – Accompagné  3 – En groupe"
    sql: ${TABLE}.etatp ;;
  }
  dimension: grav {
    type: number
    description: "Gravité de blessure de l'usager, les usagers accidentés sont classés en trois catégories de  victimes plus les indemnes :  1 – Indemne  2 – Tué  3 – Blessé hospitalisé  4 – Blessé léger"
    sql: ${TABLE}.grav ;;
  }
  dimension: id_vehicule {
    type: string
    description: "Identifiant unique du véhicule repris pour chacun des usagers occupant ce véhicule (y compris les  piétons qui sont rattachés aux véhicules qui les ont heurtés) – Code numérique."
    sql: ${TABLE}.id_vehicule ;;
  }
  dimension: locp {
    type: number
    description: "Localisation du piéton :  -1 – Non renseigné  0 – Sans objet  Sur chaussée :  1 – A + 50 m du passage piéton  2 – A – 50 m du passage piéton  Sur passage piéton :  3 – Sans signalisation lumineuse  4 – Avec signalisation lumineuse Localisation du piéton :  -1 – Non renseigné  0 – Sans objet  Sur chaussée :  1 – A + 50 m du passage piéton  2 – A – 50 m du passage piéton  Sur passage piéton :  3 – Sans signalisation lumineuse  4 – Avec signalisation lumineuse"
    sql: ${TABLE}.locp ;;
  }
  dimension: num_acc {
    type: number
    primary_key: yes
    description: "dentifiant de l’accident identique à celui du fichier \"rubrique CARACTERISTIQUES\" repris pour chacun  des usagers décrits impliqués dans l’accident."
    sql: ${TABLE}.Num_Acc ;;
  }
  dimension: num_veh {
    type: string
    description: "Identifiant du véhicule repris pour chacun des usagers occupant ce véhicule (y compris les piétons qui sont rattachés aux véhicules qui les ont heurtés) – Code alphanumérique."
    sql: ${TABLE}.num_veh ;;
  }
  dimension: place {
    type: number
    description: "Permet de situer la place occupée dans le véhicule par l'usager au moment de l'accident. 1-conducteur 2- passager 10-pièton"
    sql: ${TABLE}.place ;;
  }
  dimension: secu1 {
    type: number
    description: "Le renseignement du caractère indique la présence et l’utilisation de l’équipement de sécurité :  -1 – Non renseigné  0 – Aucun équipement  1 – Ceinture  2 – Casque  3 – Dispositif enfants  4 – Gilet réfléchissant  5 – Airbag (2RM/3RM)  6 – Gants (2RM/3RM)  7 – Gants + Airbag (2RM/3RM)  8 – Non déterminable  9 – Autre"
    sql: ${TABLE}.secu1 ;;
  }
  dimension: secu2 {
    type: number
    description: "Le renseignement du caractère indique la présence et l’utilisation de l’équipement de sécurité :  -1 – Non renseigné  0 – Aucun équipement  1 – Ceinture  2 – Casque  3 – Dispositif enfants  4 – Gilet réfléchissant  5 – Airbag (2RM/3RM)  6 – Gants (2RM/3RM)  7 – Gants + Airbag (2RM/3RM)  8 – Non déterminable  9 – Autre"
    sql: ${TABLE}.secu2 ;;
  }
  dimension: secu3 {
    type: number
    description: "Le renseignement du caractère indique la présence et l’utilisation de l’équipement de sécurité :  -1 – Non renseigné  0 – Aucun équipement  1 – Ceinture  2 – Casque  3 – Dispositif enfants  4 – Gilet réfléchissant  5 – Airbag (2RM/3RM)  6 – Gants (2RM/3RM)  7 – Gants + Airbag (2RM/3RM)  8 – Non déterminable  9 – Autre"
    sql: ${TABLE}.secu3 ;;
  }
  dimension: sexe {
    type: number
    description: "Sexe de l'usager :  1 – Masculin  2 – Féminin"
    sql: ${TABLE}.sexe ;;
  }
  dimension: trajet {
    type: number
    description: "Motif du déplacement au moment de l’accident :  -1 – Non renseigné  0 – Non renseigné  1 – Domicile – travail  2 – Domicile – école  3 – Courses – achats  4 – Utilisation professionnelle  5 – Promenade – loisirs  9 – Autre"
    sql: ${TABLE}.trajet ;;
  }
  measure: count {
    type: count
  }
}
