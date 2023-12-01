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


explore: vin {}


explore: caracteristiques {
  label: "Accident"
  join: lieux {
    type: left_outer
    relationship: one_to_one
    sql_on: ${caracteristiques.num_acc} = ${lieux.num_acc} ;;
  }

  join: vehicules{
    type: left_outer
    relationship: one_to_many
    sql_on: ${caracteristiques.num_acc} = ${vehicules.num_acc} ;;
  }

  join: usagers {
    type: left_outer
    relationship: one_to_many
    sql_on: ${caracteristiques.num_acc} = ${usagers.num_acc};;
  }


}





#exo 7
explore: AccidentLimit {

  from: vehicules
label: "vehicule"
  join: lieux {
    sql_on: ${AccidentLimit.num_acc} = ${lieux.num_acc} ;;
    type: left_outer
    relationship: one_to_one
    fields: [lieux.catr,lieux.circ]
  }
  join: caracteristiques {
    sql_on: ${AccidentLimit.num_acc} = ${caracteristiques.num_acc} ;;
    type: left_outer
    relationship: many_to_one
    fields: [caracteristiques.an_cacher]
  }
always_filter: {
  filters: [caracteristiques.an_cacher: "2020"]
}




}





map_layer: departement_france {
  file: "/Map/departements.geojson"
  format: topojson
}
