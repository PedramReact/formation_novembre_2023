include: "/views/vin.view.lkml"
view: +vin {
  measure: distinct_model {
    type:  count_distinct
    sql: ${model};;
  }
  dimension: model {
    drill_fields: [distinct_model, model]
  }
  dimension: delearnamemodif {
    type: string
    sql: REPLACE(${dealer_name},' ','-');;
  }
  dimension: typedecarburant{
    type: string
    sql: CASE
    When ${fuel_type}='DIESEL' then 'Gasoil'
    When ${fuel_type}='ELECTRIC' then 'Electrique'
    When ${fuel_type}='PETROL' then 'Essence'
    When (${fuel_type}='PETROL CNGGAZ' or ${fuel_type}='PETROL LPG') then 'Gaz'
    Else ''
    end;;
  }
  dimension: Concat_Model_Version{
    type: string
    sql: Concat(${model},${version});;
  }
  dimension: order_date_test{
    type: string
    sql: PARSE_DATE("%Y-%m-%d", ${order_date});;
  }
}
