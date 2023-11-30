include: "/views/vin.view.lkml"
view: +vin {

#
 measure: distinct_model {
    type: count_distinct
    sql: ${model} ;;
    drill_fields: [model]
    label: "nombre de modeles"
  }

#
  dimension: DealerNameModified{
    type: string
    sql: replace(${dealer_name}, ' ', '_' );;
    label: "nom du dealer"
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
        label: "type de carburant"
  }

  #
  dimension: concat_model_version {
    type: string
    sql: concat(${model},'-',${version}) ;;
    drill_fields: [brand, model, version, catalogue_price]
    label: "mode et version"
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
    label: "date de commande"
  }

  #
  dimension: date {
    sql: ${invoice_date} ;;
    html:{{ rendered_value | date: "%A %e %b  %Y" }};;
    label: "date de facturation (J M A)"

  }

  #
  measure: min_catalogue_price {
    type: min
    sql: ${catalogue_price} ;;
    value_format: "0.0€"
    label: "prix minimum au catalogue"
  }

  #
  measure: max_catalogue_price {
    type: max
    sql: ${catalogue_price} ;;
    value_format: "0.0€"
    label: "prix maximum au catalogue"
  }

  #
  measure: avg_catalogue_price {
    type: average
    sql: ${catalogue_price} ;;
    value_format: "0.0€"
    label: "prix moyen au catalogue"
  }

  #
  dimension: dif {
    type: number
    sql: date_diff(${invoice_date},${order_date_string_to_date__date},day) ;;
    label: "dela de facturation"
  }

  #
  measure: min_of_dif {
    type: min
    sql: ${dif} ;;
    label: "delai minimum de facturation"
  }

  #
  measure: max_of_dif {
    type: max
    sql: ${dif} ;;
    label: "delai maximum de facturation"
  }

  #
  measure: avg_of_dif {
    type: average
    sql: ${dif} ;;
    label: "delai moyen de facturation"
  }

  #
  dimension: brand_logo {
    sql: ${brand} ;;
    html:
    {% if value == "ALPINE" %}
    <img src="https://upload.wikimedia.org/wikipedia/commons/4/49/Renault_2009_logo.svg" height="170" width="255"/>
    {% elsif value == "ALPINE" %}
    <img src="https://www.retro-laser.com/wp-content/uploads/2021/12/2021-12-13-at-08-17-16.jpg" height="170" width="255"/>
    {% elsif value == "DACIA" %}
    <img src="https://upload.wikimedia.org/wikipedia/fr/4/4d/Logo_Dacia.svg" height="170" width="255"/>
    {% endif %};;

    label: "logo de la marque"
  }

}
