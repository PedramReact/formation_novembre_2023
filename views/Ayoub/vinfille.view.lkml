include: "/views/vin.view.lkml"

view: +vin {
  measure: distinct_models {
    type: count_distinct
    sql: ${model} ;;
    drill_fields: [model]
  }
  dimension: DealerNameModifier {
    type: string
    sql: replace(${dealer_name}, " ", "_") ;;
  }
  dimension: typeCarburent {
    type: string
    case: {
      when: {
        sql: ${fuel_type} = "DIESEL" ;;
        label: "Gasoil"
      }
      when: {
        sql: ${fuel_type} = "ELECTRIC" ;;
        label: "Electrique"
      }
      when: {
        sql: ${fuel_type} = "PETROL" ;;
        label: "Essence"
      }
      when: {
        sql: ${fuel_type} = "PETROL CNGGAZ" OR ${fuel_type} = "PETROL LPG" ;;
        label: "Gaz"
      }
    }
  }
  dimension: Concat_model_version {
    type: string
    sql: ${model}||"-"||${version} ;;
    drill_fields: [brand, model, version, catalogue_price]
  }
  dimension: order_date_string_to_date {
    type: date
    sql: PARSE_DATE(%Y-%m-%d, ${order_date}) ;;
  }
 }
