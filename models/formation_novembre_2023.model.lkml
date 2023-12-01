connection: "formation_looker"

# include all the views
include: "/views/**/*.view.lkml"
include: "/ahamada/vinfille.view.lkml"

include: "/test_dashboard_pauline.dashboard.lookml"

include: "/ahamada/Dashbordcopy.dashboard.lookml"

datagroup: formation_novembre_2023_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: formation_novembre_2023_default_datagroup

explore: vehicules {
  label: "Accident_Vehicule"
  join: caracteristiques {
    sql_on: ${vehicules.num_acc} = ${caracteristiques.num_acc}   ;;
    type: left_outer
    relationship: many_to_one
  }
  join: lieux {
    sql_on: ${vehicules.num_acc} = ${lieux.num_acc} ;;
    type: left_outer
    relationship: one_to_one
  }
  join: usagers {
    sql_on: ${vehicules.num_acc} = ${usagers.num_acc} ;;
    type: left_outer
    relationship: one_to_many
      }
}
explore: caracteristiques {

}

explore: vin {}
