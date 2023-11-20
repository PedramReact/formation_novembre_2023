include: "/views/vin.view.lkml"
view: +vin{
  drill_fields: [source*,model]
  measure: distinct_engine {
    type: count_distinct
    sql:${model}  ;;
    drill_fields: [model]
  }
  dimension: DealerNameModifier {
    sql: replace(${dealer_name},' ','_');;
  }
  set: source{
    fields: [model]
  }
  }
