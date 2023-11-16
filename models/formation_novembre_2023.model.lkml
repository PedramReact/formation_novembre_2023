connection: "formation_looker"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: formation_novembre_2023_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: formation_novembre_2023_default_datagroup

explore: caracteristiques {}

explore: vehicules {}

explore: lieux {}

explore: vin {}

explore: accidents {
}

explore: usagers {}
