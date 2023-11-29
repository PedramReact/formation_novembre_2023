include: "/views/vehicules.view.lkml"
include: "/views/caracteristiques.view.lkml"

explore: vehicules {
  join : caracteristiques  {
    view_label: "caractéristiques"
    type: left_outer
    relationship: one_to_many
    sql_on: ${vehicules.num_acc}=${caracteristiques.num_acc};;
  }
}
