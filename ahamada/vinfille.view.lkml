include: "/views/vin.view.lkml"
view: +vin{
  drill_fields: [source*,model,brand,version,catalogue_price]
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
            when ${fuel_type} in ('PETROL CNGGAZ','PETROL LPG') then 'Gaz'
            End;;
    label: "type de carburant"
  }
  dimension: concatenateModelVersion {
    sql: concat(${model},${version}) ;;
    label: "Concat Model Version"
    drill_fields: [brand,model,version,catalogue_price]
  }
  dimension_group: orderdatestringtodate {
    type: time
    timeframes: [
      day_of_week,
      week,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${order_date} ;;
    label: "Order date string to date"
  }
  dimension: date_formatted {
    #group_label: "Created date"
    label: "Date"
    type: date
    sql: ${invoice_date} ;;
    html: {{ value | date: "%A %d %b %y" }};;
  }
  measure: maxcatalogueprice {
    type: max
    sql: ${catalogue_price} ;;
    label: "Max Catalogue Price"
    value_format: "\"€\"0.0"
  }
  measure: mincatalogueprice {
    type: min
    value_format: "\"€\"0.0"
    sql: ${catalogue_price} ;;
    label: "Min Catalogue Price"
  }
  measure: avgcatalogueprice {
    type: average
    sql: ${catalogue_price} ;;
    value_format: "\"€\"0.0"
    label: "Avg Catalogue Price"
  }
  set: source{
    fields: [model,brand,version,catalogue_price]
  }
  }
