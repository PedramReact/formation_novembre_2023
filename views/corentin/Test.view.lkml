include: "/views/vehicules.view.lkml"
include: "/views/caracteristiques.view.lkml"
include: "/views/lieux.view.lkml"
include: "/views/usagers.view.lkml"


explore: vehicules {
  join : usagers  {
    view_label: "usagers"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vehicules.num_acc}=${usagers.num_acc};;
  }
  join : lieux {
    view_label: "lieux"
    type: left_outer
    relationship: one_to_one
    sql_on: ${vehicules.num_acc}=${lieux.num_acc};;
  }
  join : caracteristiques  {
    view_label: "caracteristiques"
    type: left_outer
    relationship: one_to_one
    sql_on: ${vehicules.num_acc}=${caracteristiques.num_acc};;
  }
}
