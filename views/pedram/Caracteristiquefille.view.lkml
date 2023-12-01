include: "/views/caracteristiques.view.lkml"
include: "/views/usagers.view.lkml"
view: +caracteristiques {

#exo 1 partis 2
dimension_group: aujour {
  label: "Date d'aujourd'hui"
  sql: current_date() ;;
  type: time
  datatype: date
  timeframes: [year, month, day_of_month, date]

}
measure: diff_aujour {
  label: "exo 2 partie 2 ancianiter d'accident"
  type: number
  sql: ${aujour_year} - ${an}  ;;
}



dimension: an_cacher {
  sql: ${an} ;;
  hidden: yes
}


}
