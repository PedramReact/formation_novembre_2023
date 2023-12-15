include: "/views/caracteristiques.view.lkml"
view: +caracteristiques {
  dimension_group: datetime_today {
    type: time
    datatype: date
    sql: current_date() ;;
    timeframes: [date,month,year]
  }
  measure: anciente_accident {
    type: number
    sql: ${datetime_today_year}-${an} ;;
  }
  dimension: age_usagers_group {
    type: string
    sql: case when ${an}-${usagers.an_nais}<=15 then 'Enfants'
              when ${an}-${usagers.an_nais}>15 and ${an}-${usagers.an_nais}<=24 then 'Adolescents'
              when ${an}-${usagers.an_nais}>24 and ${an}-${usagers.an_nais}<=64 then 'Adultes'
              when ${an}-${usagers.an_nais}>64 then 'Aînés'
              Else 'Autres' End;;
  }
  dimension_group: date_accident {
    type: time
    sql: date(${an},${mois},${jour}) ;;
    timeframes: [date,year,month,day_of_month]
    datatype: date
  }
  dimension: adresse {
    sql: concat(${adr},'-',${dep}) ;;
    link: {
      label: "Google"
      url: "http://www.google.com/maps?q={{ value }}"
      icon_url: "http://google.com/favicon.ico"
    }
  }
  dimension: an_accident {
    type: number
    sql: ${an} ;;
    hidden: yes
  }
  measure: nombre_accident_2019 {
    type: count
    filters: [an: "2019"]
    drill_fields: [source*]
  }
  measure: nombre_accident_2020 {
    type: count
    filters: [an: "2020"]
    drill_fields: [source*]
  }
  measure: nombre_accident_2021 {
    type: count
    filters: [an: "2021"]
    drill_fields: [source*]
  }

  set: source {
    fields: [num_acc,adr,dep]
  }

  }
