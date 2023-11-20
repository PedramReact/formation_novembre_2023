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
 }
