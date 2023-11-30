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



explore: vin {}


explore: caracteristiques_accident {
  label: "Accident"
  join: lieux_accidents {
    type: left_outer
    relationship: one_to_one
    sql_on: ${caracteristiques_accident.num_acc} = ${lieux_accidents.num_acc} ;;
  }

  join: vehicules_accident {
    type: left_outer
    relationship: one_to_many
    sql_on: ${caracteristiques_accident.num_acc} = ${vehicules_accident.num_acc} ;;
  }

  join: usagers_accident {
    type: left_outer
    relationship: one_to_many
    sql_on: ${caracteristiques_accident.num_acc} = ${usagers_accident.num_acc};;
  }


}
