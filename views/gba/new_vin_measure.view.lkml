include: "/views/vin.view.lkml"
view:  +vin
{
  measure: distinct_engine
  {
    type:  count_distinct
    sql:  ${engine} ;;
  }
  measure: distinct_model
  {
    type:  count_distinct

    sql:  ${model};;
  }


  dimension:  Dealer_Name_Modified
  {
    #drill_fields: [source*, model]
    drill_fields: [dealer_name, Dealer_Name_Modified]
    sql: REPLACE(${dealer_name}, " ", "_");;
  }

  dimension:  Type_carburant
  {

    drill_fields: [fuel_type,Type_carburant]
    case:
    {
      when:{ sql: ${fuel_type}= "DIESEL" ;;
        label: "Gasoil"}

      when: {sql: ${fuel_type}= "ELECTRIQUE" ;;
        label: "Electrique"}

      when:  { sql: ${fuel_type}= "PETROL" ;;
        label: "Essence"}

      when: { sql: ${fuel_type}= "PETROL CNGGAZ" ;;
        label: "Gaz" }
      when: { sql: ${fuel_type}= "PETROL LPG" ;;
        label: "Gaz"}
      else: "Other"
    }
  }

  dimension:  VinDataConcatModelVersion
  {
    drill_fields: [brand,model,version,catalogue_price]
    sql: CONCAT(${model},"-",${version});;
  }

  dimension_group: order_date
  {
    type:  time
    timeframes: [
      date, day_of_week,month,week,year]
   datatype:  date
  }

  dimension: date_formatted
  {
    group_label: "Date"
    label: "Date"
    sql: ${invoice_date};;
    html: {{rendered_value | date: "%A %d %h %y"}}  ;;
  }

  measure: mean_catalogue_price
  {
    type:  min
    value_format: "0;0€"
    sql:  ${catalogue_price};;
  }

  measure: average_catalogue_price
  {
    type:  average
    value_format: "0;0€"
    sql:  ${catalogue_price};;
  }

  dimension: difference_date
  {
    type: number
    sql:  date_diff(${invoice_date},${order_date_date},day) ;;
  }

  measure: min_difference_date
  {
    type: min
    sql:  ${difference_date};;
  }

  measure: max_difference_date
  {
    type: max
    sql:  ${difference_date};;
  }

  measure: avg_difference_date
  {
    type: average
    sql:  ${difference_date};;
  }

dimension: brand_logo {
 sql: ${brand}  ;;
 html: { % if  value == "ALPINE" %}
 html: <img src: "https://www.retro-laser.com/wp-content/uploads/2021/12/2021-12-13-at-08-17-16.jpg" /> {% endif %};;
}

  set: source {
    fields: [brand,Dealer_Name_Modified]
  }


}
