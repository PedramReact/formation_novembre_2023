include: "/views/vin.view.lkml"
view: +vin {
  measure: count {
    type: count_distinct
    sql: ${engine}
  ;;
  }
}
