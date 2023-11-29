include: "/views/vehicules.view.lkml"
include: "/views/caracteristiques.view.lkml"

explore: vehicules {
  join : caracteristiques  {
    view_label: "ceci est un test vehicules"
    sql: LEFT JOIN ${caracteristiques.num_acc} ;;
    relationship: one_to_many
  }
}
