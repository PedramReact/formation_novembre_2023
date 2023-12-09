connection: "formation_looker"

# include all the views
#include: "/views/**/*.view.lkml"
#include: "/ahamada/vinfille.view.lkml"
include: "/ahamada/*.view.lkml"
datagroup: formation_novembre_2023_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: formation_novembre_2023_default_datagroup

explore: vehicules {
  join: caracteristiques {
    type: left_outer
    relationship: many_to_one
    sql_on: ${vehicules.num_acc}=${caracteristiques.num_acc} ;;
  }
  join: lieux {
    type: left_outer
    relationship: one_to_one
    sql_on: ${vehicules.num_acc}=${lieux.num_acc} ;;
  }
  join: usagers {
    type: left_outer
    relationship: one_to_many
    sql_on: ${vehicules.num_acc}=${usagers.num_acc} ;;
  }
}

explore: voitures {
  from: vehicules
  join: caracteristiques {
    type: left_outer
    relationship: many_to_one
    sql_on: ${voitures.num_acc}=${caracteristiques.num_acc} ;;
    fields: [caracteristiques.an_accident]
  }
  join: lieux {
    type: left_outer
    relationship: one_to_one
    sql_on: ${voitures.num_acc}=${lieux.num_acc} ;;
    fields: [lieux.catr,lieux.circ]
  }
  always_filter: {
    filters: [caracteristiques.an_accident: "2020"]
  }
}
explore: vin {}
#explore: lieux {}
#explore: usagers {}
#explore: vehicules {}
#explore: caracteristiques {}
