include: "/views/vin.view.lkml"
view: +vin {
  measure: distinct_model_corentin {
    type:  count_distinct
    sql: ${model};;
  }
  dimension: model {
    drill_fields: [distinct_model_corentin, model]
  }
  dimension: delearnamemodif_corentin {
    type: string
    sql: REPLACE(${dealer_name},' ','-');;
  }
  dimension: typedecarburant_corentin{
    type: string
    sql: CASE
    When ${fuel_type}='DIESEL' then 'Gasoil'
    When ${fuel_type}='ELECTRIC' then 'Electrique'
    When ${fuel_type}='PETROL' then 'Essence'
    When (${fuel_type}='PETROL CNGGAZ' or ${fuel_type}='PETROL LPG') then 'Gaz'
    Else ''
    end;;
  }
  dimension: Concat_Model_Version_corentin{
    type: string
    sql: Concat(${model},${version});;
  }
  dimension_group: order_date_corentin{
    type: time
    timeframes:  [
      date,
      week,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${order_date};;
  }
 # dimension: invoice_date_corentin{
   # type: date_day_of_month(${invoice_date});;
 # }
  measure: Min_catalogue_price_corentin {
    type:  min
    value_format: "\"€\"0.0"
    sql: ${catalogue_price};;
  }
  measure: Max_catalogue_price_corentin {
    type:  max
    value_format: "\"€\"0.0"
    sql: ${catalogue_price};;
  }
  measure: Avg_catalogue_price_corentin {
    type:  average
    value_format: "\"€\"0.0"
    sql: ${catalogue_price};;
  }
  measure: Diff_order_invoice_Corentin {
    type: number
    sql: date_diff(${invoice_date},${order_date},day);;
  }
  measure: Min_Diff_order_invoice_Corentin {
    type: min
    sql: date_diff(${invoice_date},${order_date},day);;
  }
  measure: Max_Diff_order_invoice_Corentin {
    type: max
    sql: date_diff(${invoice_date},${order_date},day);;
  }
  measure: Avg_Diff_order_invoice_Corentin {
    type: average
    sql: date_diff(${invoice_date},${order_date},day);;
  }
  dimension: image_corentin{
    sql:  ${brand} ;;
    link : {
      url : "RENAULT : https://upload.wikimedia.org/wikipedia/commons/4/49/Renault_2009_logo.svg"
      }
  }
}
