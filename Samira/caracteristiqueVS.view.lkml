include: "/views/caracteristiques.view.lkml"
view: +caracteristiques {

  dimension: NumeroAccident {
    sql: ${num_acc} ;;
    primary_key: yes
  }

dimension: CreateAccidnetDate {
  type: date
  sql:date(${an},${mois},${jour})  ;;
}

dimension: mindate {
  type: date
  sql: min(${CreateAccidnetDate}) ;;
}
dimension: maxdate {
  type: date
  sql: max(${CreateAccidnetDate}) ;;
  }
measure:  Anc{
  type: number
  sql: date_diff(${maxdate},${mindate},day) ;;
}
}
