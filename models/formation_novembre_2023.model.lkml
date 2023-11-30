connection: "formation_looker"

# include all the views
include: "/views/**/*.view.lkml"
##<<<<<<< HEAD
#include: "/gba/new_vin_measure.view.lkml"

##=======
include: "/ahamada/vinfille.view.lkml"

include: "/test_dashboard_pauline.dashboard.lookml"

include: "/ahamada/Dashbordcopy.dashboard.lookml"


##>>>>>>> 1f016a1389930dee5632c9a0ee9cea4b2bf340dd
datagroup: formation_novembre_2023_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: formation_novembre_2023_default_datagroup

explore : caracteristiques {
  label: " Accident"
  join: lieux {
    sql: ${caracteristiques.num_acc} = ${lieux.num_acc} ;;
    relationship: one_to_one
    type:  left_outer
     }
  join: vehicules {
    sql: ${caracteristiques.num_acc} = ${vehicules.num_acc} ;;
    relationship: one_to_many
    type:  left_outer
  }
  join: usagers {
    sql: ${caracteristiques.num_acc} = ${usagers.num_acc} ;;
    relationship: one_to_many
    type:  left_outer
  }
}

explore: vin {}
