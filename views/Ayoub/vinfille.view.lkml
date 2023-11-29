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
  dimension_group: order_date_string_to_date {
    type: time
    datatype: date
    timeframes: [raw, year, month_num, week_of_year, day_of_week]
    sql: ${TABLE}.order_date ;;
  }
  dimension: date {
    sql: ${invoice_date} ;;
    html: {{rendered_value | date: "%A %d %b %C" }} ;;
  }
  measure: min_catalogue {
    sql: MIN(${catalogue_price}) ;;
    html: {{rendered_value}}€ ;;
  }
  measure: max_catalogue {
    sql: MAX(${catalogue_price}) ;;
    html: {{rendered_value}}€ ;;
  }
  measure: avg_catalogue {
    sql: AVG(${catalogue_price}) ;;
    html: {{rendered_value}}€ ;;
  }
  dimension_group: date_difference {
    type: duration
    intervals: [day]
    sql_start: ${order_date_string_to_date_raw} ;;
    sql_end: ${invoice_date} ;;
  }
  measure: date_difference_max {
    type: number
    sql: MAX(${days_date_difference}) ;;
  }
  measure: date_difference_min {
    type: number
    sql: MIN(${days_date_difference}) ;;
  }
  measure: date_difference_avg {
    type: number
    sql: AVG(${days_date_difference}) ;;
  }
  dimension: brand_logo {
    sql: ${brand} ;;
    html: {% if value == "RENAULT" %}
            <img height="170" width="255" src="https://upload.wikimedia.org/wikipedia/commons/4/49/Renault_2009_logo.svg" />
          {% elsif value == "DACIA" %}
            <img height="170" width="255" src="https://upload.wikimedia.org/wikipedia/fr/4/4d/Logo_Dacia.svg" />
          {% elsif value == "ALPINE" %}
            <img height="170" width="255" src="https://www.retro-laser.com/wp-content/uploads/2021/12/2021-12-13-at-08-17-16.jpg" />
          {% endif %};;
  }
 }
