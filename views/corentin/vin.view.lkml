include: "/views/vin.view.lkml"
view: +vin {
  measure: distinct_model {
    type:  count_distinct
    sql: ${model};;
  }
  measure: distinct_engine {
    type:  count_distinct
    sql: ${engine};;
  }
}
