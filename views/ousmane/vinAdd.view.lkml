include: "/views/vin.view.lkml"
view: +vin {
  measure: distinct_model {
    type: count_distinct
    sql: ${model} ;;
  }
  drill_fields: [model]

  dimension: DealerNameModified{
    type: string
    sql: replace(${dealer_name}, ' ', '_' );;
}

  dimension: fuel {
    type: string
    sql: case
          when ${fuel_type} = 'DIESEL' then 'gasoil'
          when ${fuel_type} = 'ELECTRIC' then 'electrique'
          when ${fuel_type} = 'PETROL' then 'essence'
          when ${fuel_type} IN ('PETROL CNGGAZ', 'PETROL LPG') then 'gaz'
          else 'others'
        end
        ;;
  }
}
