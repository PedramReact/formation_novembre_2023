include: "/views/caracteristiques.view.lkml"
view: +caracteristiques{

  dimension_group: current_date {
    type: time
    timeframes: [
      date,
      month,
      year
    ]
    datatype: date
    sql: current_date() ;;
    label: "date du jour"
  }

  measure: accident_seniority{
    type: number
    sql: ${current_date_year} - ${an} ;;
    label: "anciennete accident"
  }

  dimension: date_accident {
    type: date
    sql: concat(${an}, '-', ${mois}, '-', ${jour}) ;;
  }

  dimension: adresse {
    type: string
    sql: concat(${adr}, ' - ', 'dans le departement ', ${dep}) ;;
    link: {
      label: "Google Maps"
      url: "https://www.google.com/maps/?q={{value}}"
      icon_url: "https://google.com/favicon.ico"
    }
  }

  measure: accident_2019 {
    type: count
    filters: [an: "2019"]
    label: "Nombre d'accident 2019"
    drill_fields: [dep, adr, num_acc]
  }

  measure: accident_2020 {
    type: count
    filters: [an: "2020"]
    label: "Nombre d'accident 2020"
    drill_fields: [dep, adr, num_acc]
  }

  measure: accident_2021 {
    type: count
    filters: [an: "2021"]
    label: "Nombre d'accident 2021"
    drill_fields: [dep, adr, num_acc]
  }

  dimension: Departement {
    sql: ${dep} ;;
    map_layer_name: dep_map_departement
  }


}
