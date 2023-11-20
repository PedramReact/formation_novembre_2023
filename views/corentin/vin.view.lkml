include: "/views/vin.view.lkml"
view: +vin {
  measure: distinct_model {
    type:  count_distinct
    sql: ${model};;
  }
}
