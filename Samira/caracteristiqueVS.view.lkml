include: "/views/caracteristiques.view.lkml"
view: +caracteristiques {

  dimension: NumeroAccident {
    sql: ${num_acc} ;;
    primary_key: yes
  }

}
