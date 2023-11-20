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
  dimension: typeCarburant {
    sql: case
            when ${fuel_type}='DIESEL'   then 'Gasoil'
            when ${fuel_type}='ELECTRIC' then 'Electrique'
            when ${fuel_type}='PETROL'   then 'Essence'
            when ${fuel_type}='PETROL CNGGAZ' or ${fuel_type}='PETROL LPG' then 'Gaz'
            End;;
    label: "type de carburant"
  }
  set: source{
    fields: [model]
  }
  }
