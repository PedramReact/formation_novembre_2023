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



explore: vin {}
