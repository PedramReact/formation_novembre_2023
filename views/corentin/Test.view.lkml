include: "/views/vehicules.view.lkml"
include: "/views/caracteristiques.view.lkml"

explore: vehicules {
  join : caracteristiques  {
    view_label: "caractéristiques"
    sql: LEFT JOIN ${caracteristiques.num_acc}=${vehicules.num_acc} ;;
    relationship: one_to_many
  }
}
