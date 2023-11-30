include: "/views/vin.view.lkml"
view: +vin {

#
 measure: distinct_model {
    type: count_distinct
    sql: ${model} ;;
    drill_fields: [model]
  }

#
  dimension: DealerNameModified{
    type: string
    sql: replace(${dealer_name}, ' ', '_' );;
  }

#
  dimension: type_de_carburant{
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

  #
  dimension: concat_model_version {
    type: string
    sql: concat(${model},'-',${version}) ;;
    drill_fields: [brand, model, version, catalogue_price]
  }

  #
  dimension_group: order_date_string_to_date_ {
    type: time
    timeframes: [
      date,
      day_of_week,
      week,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${order_date} ;;
  }

  #
  dimension: date {
    sql: ${invoice_date} ;;
    html:{{ rendered_value | date: "%A %e %b  %Y" }};;

  }

  #
  measure: min_catalogue_price {
    type: min
    sql: ${catalogue_price} ;;
    value_format: "0.0€"
  }

  #
  measure: max_catalogue_price {
    type: max
    sql: ${catalogue_price} ;;
    value_format: "0.0€"
  }

  #
  measure: avg_catalogue_price {
    type: average
    sql: ${catalogue_price} ;;
    value_format: "0.0€"
  }

  #
  dimension: dif {
    type: number
    sql: date_diff(${invoice_date},${order_date_string_to_date__date},day) ;;
  }

  #
  measure: min_of_dif {
    type: min
    sql: ${dif} ;;
  }

  #
  measure: max_of_dif {
    type: max
    sql: ${dif} ;;
  }

  #
  measure: avg_of_dif {
    type: average
    sql: ${dif} ;;
  }

  #
  dimension: brand_logo {
    sql: ${brand} ;;
    html:
    {% if value == "ALPINE" %}
    <img src="https://upload.wikimedia.org/wikipedia/commons/4/49/Renault_2009_logo.svg" height="170" width="255"/>
    {% elseif value == "ALPINE" %}
    <img src="https://www.retro-laser.com/wp-content/uploads/2021/12/2021-12-13-at-08-17-16.jpg" height="170" width="255"/>
    {% elseif value == "DACIA" %}
    <img src="https://upload.wikimedia.org/wikipedia/fr/4/4d/Logo_Dacia.svg" height="170" width="255"/>
    {% endif %};;
  }

}
