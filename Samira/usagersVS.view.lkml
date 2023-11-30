include: "/views/usagers.view.lkml"
view: +usagers {
  dimension: IdentifiantVeh{
    sql: ${id_vehicule} ;;
    primary_key: yes
  }
}
