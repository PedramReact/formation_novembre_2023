include: "/views/vin.view.lkml"
include: "/views/caracteristiques.view.lkml"
include: "/views/lieux.view.lkml"
include: "/views/usagers.view.lkml"
include: "/views/vehicules.view.lkml"
view: +vin {
  measure: distinct_engine{
    type: count_distinct
    sql: ${engine} ;;
  }
  dimension_group: order_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.order_date ;;
  }
}
