include: "/views/vin.view.lkml"
view: +vin {
  measure: distinct_model {
    type:  count_distinct
    sql: ${model};;
  }
  dimension: model {
    drill_fields: [distinct_model, model]
  }
  dimension: typedecarburant{
    type: string
    sql: CASE
    When ${Fuel Type}='DIESEL' then 'Gasoil'
    When ${Fuel Type}='ELECTRIC' then 'Electrique'
    When ${Fuel Type}='PETROL' then 'Essence'
    When ${Fuel Type}='PETROL CNGGAZ' or ${Fuel Type}='PETROL LPG ' then 'Gaz'
    Else ''
    end;;
  }
}
