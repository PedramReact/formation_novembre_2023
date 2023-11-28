include: "/views/vin.view.lkml"

view: +vin {
measure: distinct_model {
  type:  count_distinct
  sql: ${model} ;;
  drill_fields: [source*,model]
}

dimension: DealerNameModifier {
  sql: replace(${dealer_name},' ','_') ;;
}

dimension: TypeDeCarburant{
  sql: case
       when ${fuel_type}="DIESEL" then "Gasoil"
       when ${fuel_type}="ELECTRIC" then "Electrique"
       when ${fuel_type}="PETROL" then "Essence"
       when ${fuel_type} in ("PETROL CNGGAZ","PETROL LPG") then "Gaz"
      end;;
}
  dimension: concatenateModelVersion {
    sql: concat(${model},${version}) ;;
    label: "Concat Model Version"
    drill_fields: [brand,model,version,catalogue_price]
  }
dimension_group: OrderDateStringToDateDate{
  type: time
  timeframes: [date,day_of_week,week,month,year]
  convert_tz: no
  sql: ${order_date} ;;
  datatype: date
}
dimension: date_formatted {
    sql: ${invoice_date} ;;
    html: {{value |date:"%A %d %b %y" }} ;;
    label: "Date"
  }
  measure: maxcatalogueprice {
    type: max
    sql: ${catalogue_price} ;;
    label: "Max Catalogue Price"
    value_format: "0.0€"
  }
  measure: mincatalogueprice {
    type: min
    value_format: "0.0€"
    sql: ${catalogue_price} ;;
    label: "Min Catalogue Price"
  }
  measure: avgcatalogueprice {
    type: average
    sql: ${catalogue_price} ;;
    value_format: "0.0€"
    label: "Avg Catalogue Price"
  }
  measure: diffdate {
    type: number
    sql: date_diff(${invoice_date},${order_date},day) ;;
    label: "diff"
  }
  measure: mindiff {
    type: min
    sql: date_diff(${invoice_date},${order_date},day) ;;
    label: "min of dif"
  }
  measure: maxdiff {
    type: max
    sql: date_diff(${invoice_date},${order_date},day) ;;
    label: "max of dif"
  }
  measure: avgdiff {
    type: average
    value_format: "0"
    sql: date_diff(${invoice_date},${order_date},day) ;;
    label: "avg of dif"
  }

  dimension: imge_sam {
    sql: ${brand} ;;
    html:
       {% if value=="RENAULT" %}
         <img src="https://upload.wikimedia.org/wikipedia/commons/4/49/Renault_2009_logo.svg" height=170 width=255> {% endif %}
       {% if value=="DACIA" %}
         <img src="https://upload.wikimedia.org/wikipedia/fr/4/4d/Logo_Dacia.svg"  height=170 width=255> {% endif %}
       {% if value=="ALPINE" %}
         <img src="https://www.retro-laser.com/wp-content/uploads/2021/12/2021-12-13-at-08-17-16.jpg"  height=170 width=255>
       {% endif %};;
  }
  set: source{
    fields: [model,brand,version,catalogue_price]
  }

  }
