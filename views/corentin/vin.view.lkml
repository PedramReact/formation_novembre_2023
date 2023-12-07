#inclus la vue compris dans view appelé vin.view
include: "/views/vin.view.lkml"
#ex1-2
view: +vin {
  measure: distinct_model_corentin {
    type:  count_distinct
    sql: ${model};;
    drill_fields: [model]
  }
#ex1-3
  dimension: delearnamemodif_corentin {
    type: string
    sql: REPLACE(${dealer_name},' ','-');;
  }
#ex1-4
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
#ex1-5
  dimension: Concat_Model_Version_corentin{
    type: string
    sql: Concat(${model},${version});;
    drill_fields: [brand, model, version,catalogue_price]
  }
#ex1-6
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
#ex1-7
  dimension : invoice_date_corentin{
    group_label: "date"
    sql: ${invoice_date};;
    html: {{rendered_value | date : "%A %d %h %y" }} ;;
  }
#ex1-8
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
#ex1-9
  dimension: Diff_order_invoice_Corentin {
    type: number
    sql: date_diff(${invoice_date},${order_date},day);;
  }
  measure: Diff_order_invoice_Corentin_MIN {
    type: min
    sql: ${Diff_order_invoice_Corentin};;
  }
  measure: Max_Diff_order_invoice_Corentin_MAX {
    type: max
    sql: ${Diff_order_invoice_Corentin};;
  }
  measure: Avg_Diff_order_invoice_Corentin_AVG {
    type: average
    sql: ${Diff_order_invoice_Corentin};;
  }
#ex1-10
  dimension: logo {
    sql: ${brand};;
    html:
    {% if value == "RENAULT" %}
    <img height="170" width="255" src="https://upload.wikimedia.org/wikipedia/commons/4/49/Renault_2009_logo.svg" />
    {% elsif value == "DACIA" %}
    <img height="170" width="255" src="https://upload.wikimedia.org/wikipedia/fr/4/4d/Logo_Dacia.svg" />
    {% elsif value == "ALPINE" %}
    <img height="170" width="255" src="https://www.retro-laser.com/wp-content/uploads/2021/12/2021-12-13-at-08-17-16.jpg" />
    {% endif %};;
    }
  }
