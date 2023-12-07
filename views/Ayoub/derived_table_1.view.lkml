# If necessary, uncomment the line below to include explore_source.
# include: "formation_novembre_2023.model.lkml"

view: derived_table_num_accidents {
  derived_table: {
    explore_source: vehicules {
      column: accidents_2019 { field: caracteristiques.accidents_2019 }
      column: accidents_2020 { field: caracteristiques.accidents_2020 }
      column: accidents_2021 { field: caracteristiques.accidents_2021 }
    }
  }
  dimension: accidents_2019 {
    description: ""
    type: number
  }
  dimension: accidents_2020 {
    description: ""
    type: number
  }
  dimension: accidents_2021 {
    description: ""
    type: number
  }
}
