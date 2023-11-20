
view: vinela {
  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
    description: "Modèle"
  }

  measure: count_models {
    type: count_distinct
    sql: ${model} ;;
    description: "Nombre unique de modèles"
  }
}
