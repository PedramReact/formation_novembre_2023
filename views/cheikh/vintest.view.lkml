include: "/views/vin.view.lkml"
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
