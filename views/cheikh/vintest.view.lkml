include: "/views/vin.view.lkml"
view: +vin {
  measure: distinct_engine{
    type: count_distinct
    sql: ${engine} ;;
  }
}
