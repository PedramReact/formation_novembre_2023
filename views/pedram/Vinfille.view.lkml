include: "/views/vin.view.lkml"
view: +vin {
  measure: distinct_engine{
    type: count_distinct
    sql: ${engine} ;;
  }

measure: uniquecountmodel{
type: count_distinct
sql: ${model} ;;
drill_fields: [model]
}

dimension: replace{
  type: string
  sql: replace(${dealer_name}, ' ', '_') ;;
}

  }
