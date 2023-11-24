connection: "formation_looker"

# include all the views
include: "/views/**/*.view.lkml"
include: "/ahamada/vinfille.view.lkml"
datagroup: formation_novembre_2023_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: formation_novembre_2023_default_datagroup



explore: vin {}

explore: vehicules {
  join: usagers {
    type: left_outer
    relationship: many_to_one
    sql_on: ${vehicules.id_vehicule}=${usagers.id_vehicule} ;;
  }
  join: caracteristiques {
    type: left_outer
    relationship: many_to_one
    sql_on: ${vehicules.num_acc} = ${caracteristiques.num_acc};;
  }
  join: lieux {
    type: left_outer
    relationship:  many_to_one
    sql_on: ${vehicules.num_acc} = ${lieux.num_acc};;
  }
}
