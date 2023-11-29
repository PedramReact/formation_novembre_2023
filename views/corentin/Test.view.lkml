include: "/views/vehicules.view.lkml"
include: "/views/caracteristiques.view.lkml"
include: "/views/accidents.view.lkml"
include: "/views/lieux.view.lkml"
include: "/views/usagers.view.lkml"


explore: vehicules {
  join : accidents  {
    view_label: "accidents"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vehicules.num_acc}=${accidents.id_accident};;
  }
  join : usagers  {
    view_label: "usagers"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vehicules.id_vehicule}=${usagers.id_vehicule};;
  }
  join : lieux {
    view_label: "lieux"
    type: left_outer
    relationship: one_to_one
    sql_on: ${accidents.id_accident}=${lieux.num_acc};;
  }
  join : caracteristiques  {
    view_label: "caracteristiques"
    type: left_outer
    relationship: one_to_one
    sql_on: ${accidents.id_accident}=${caracteristiques.num_acc};;
  }
}
