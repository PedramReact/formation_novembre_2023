connection: "formation_looker"

# include all the views
include: "/views/**/*.view.lkml"
include: "/ahamada/vinfille.view.lkml"
include: "/ahamada/Dashbordcopy.dashboard.lookml"
include: "/test_ousmane.dashboard.lookml"
datagroup: formation_novembre_2023_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: formation_novembre_2023_default_datagroup



explore: vin {}
