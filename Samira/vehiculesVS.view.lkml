include: "/views/vehicules.view.lkml"
view: +vehicules {

  dimension: IdentVeh{
    sql: ${id_vehicule} ;;
    primary_key: yes
  }
}
