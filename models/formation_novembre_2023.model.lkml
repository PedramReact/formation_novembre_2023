connection: "formation_looker"

# include all the views
#include: "/views/**/*.view.lkml"
include: "/ahamada/vinfille.view.lkml"
#include: "/Samira/vinSam.view.lkml"
include: "/Samira/Dashboard_look_ml_test.dashboard.lookml"
include: "/Samira/**/*.view.lkml"
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
    relationship: many_to_one
    sql_on: ${vehicules.num_acc}=${lieux.num_acc} ;;
  }
  join: usagers {
    type: left_outer
    relationship: one_to_many
    sql_on: ${vehicules.id_vehicule}=${usagers.id_vehicule} and ${vehicules.num_acc}=${usagers.num_acc} ;;
  }
}

explore: vin {}
