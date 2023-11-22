include: "/views/vin.view.lkml"
view: +vin {
  measure: distinct_model {
    type:  count_distinct
    sql: ${model};;
    drill_fields: [model]
  }
  dimension: DealerNameModifier {
    type:  string
    sql: replace(${dealer_name}," ","_") ;;
  }
  dimension: type_de_carburant{
    type:  string
    sql:  CASE
          WHEN ${fuel_type}='DIESEL' THEN 'Gasoil'
          WHEN ${fuel_type}='ELECTRIC' THEN 'Electrique'
          WHEN ${fuel_type}='PETROL' THEN 'Essence'
          WHEN ${fuel_type}='PETROL CNGGAZ' or  ${fuel_type}='PETROL LPG' THEN 'GAZ'
          ELSE 'Other'
          END;;
  }
  dimension: Concat_Model_Version {
    type:  string
    sql: CONCAT(${model},CONCAT('-',${version})) ;;
  }
  dimension_group: order2 {
    type:  time
    timeframes: [
      raw,
      date,
      day_of_week,
      week,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    sql:  ${order_date} ;;
  }
  dimension: Date_formatted {
    type: string
    sql: ${invoice_date};;
    html: {{rendered_value | date: "%A %d %b %C" }};;
  }

  measure: Avg_catalogue_price {
    type: average
    sql: ${catalogue_price};;
    value_format_name: eur
    value_format: "0.0€"
  }

  measure: Min_catalogue_price {
    type: min
    sql: ${catalogue_price};;
    value_format_name: eur
    value_format: "0.0€"
  }

  measure: Max_catalogue_price {
    type: max
    sql: ${catalogue_price};;
    value_format: "0.0€"
  }

  dimension:  diff_day_order_invoice_date{
    type: number
    sql: DATE_DIFF(${invoice_date},${order_date}, DAY) ;;
  }

  measure:  max_diff_day_order_invoice_date{
    type: max
    sql: ${diff_day_order_invoice_date} ;;
  }

  measure:  min_diff_day_order_invoice_date{
    type: min
    sql: ${diff_day_order_invoice_date} ;;
  }

  measure:  avg_diff_day_order_invoice_date{
    type: average
    sql: ${diff_day_order_invoice_date} ;;
  }

  dimension:  brand_logo{
    sql: ${brand} ;;
    html:
      {% if value =='RENAULT'%}
      <https://upload.wikimedia.org/wikipedia/commons/4/49/Renault_2009_logo.svg>
      {% elsif value =='DACIA'%}
      <https://upload.wikimedia.org/wikipedia/fr/4/4d/Logo_Dacia.svg>
      {% elsif value =='ALPINE'%}
      <https://www.retro-laser.com/wp-content/uploads/2021/12/2021-12-13-at-08-17-16.jpg>
      {% endif%}
      ;;
  }
}
