include: "/views/caracteristiques.view.lkml"
view: +caracteristiques {
  dimension_group: aujour {
    sql: current_date() ;;
    type: time
    datatype: date
    timeframes: [year,month,day_of_month,date]
    }
    measure: diff_aujour{
    type: number
    sql: ${aujour_year}-${an};;
    }
  }
