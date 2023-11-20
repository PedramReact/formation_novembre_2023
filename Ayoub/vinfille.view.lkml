include: "/views/vin.view.lkml"

view: +vin {
  measure: distinct_engines {
    type: count_distinct
    sql: ${engine} ;;
  }
 }
