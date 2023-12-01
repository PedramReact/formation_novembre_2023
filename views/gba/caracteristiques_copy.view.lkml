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

    dimension:  age_usager {
      case: {
        when: {
          sql:  ${an} - ${usagers.an_nais} <=15 ;;
          label: " enfant"

              }
        when: {
          sql:  ${an} - ${usagers.an_nais} >15 and ${an} - ${usagers.an_nais} <=24 ;;
          label: "adolescence"
               }
        when: {
          sql:  ${an} - ${usagers.an_nais} >24 and ${an} - ${usagers.an_nais} <=64 ;;
          label: "adulte"
              }
        when: {
          sql:  ${an} - ${usagers.an_nais} >64 ;;
          label: "aine"
        }
      else: "les autres"
      }

    }

    dimension: conducteur_ou_pas {
      case: {
        when: {
         sql:  ${usagers.catu} = 1 ;;
        label: "conducteur"

        }
       else: "non conducteur"
      }

    }

  dimension: sexe {
    case: {
      when: {
        sql:  ${usagers.sexe} = 1 ;;
        label: "Monsieur"
      }
      when: {
      sql:  ${usagers.sexe} = 2 ;;
      label: "Madame"
    }
  }
}

  dimension: mortel_ou_pas {
    case: {
      when: {
        sql:  ${usagers.grav} = 2 ;;
        label: "Mortel"
      }
      else: "Non Mortel"
      }
    }
  }
