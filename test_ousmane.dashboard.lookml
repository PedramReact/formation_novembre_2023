---
- dashboard: test_ousmane
  title: Test Ousmane
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: cjUzJSYhNJP605EfBL1cie
  elements:
  - title: Nombre de model
    name: Nombre de model
    model: formation_looker
    explore: vin
    type: single_value
    fields: [vin.NombreDistinctModel]
    sorts: [vin.NombreDistinctModel desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Nombre_Distinct_Model_Custom_Fields
      value_format:
      value_format_name:
      based_on: vin.model
      _kind_hint: measure
      measure: nombre_distinct_model_custom_fields
      type: count_distinct
      _type_hint: number
      filters:
        vin.model: C%
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
        reverse: true
    x_axis_zoom: true
    y_axis_zoom: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_colors: {}
    series_labels: {}
    advanced_vis_config: |-
      {
        chart: {},
        series: [{
          name: 'Nombre Distinct Model C'
        }, {
          name: 'Nombre Distinct Model'
        }]
      }
    chart_type: Pie
    defaults_version: 1
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    hidden_fields: []
    hidden_points_if_no: []
    listen:
      Brand: vin.brand
      Order Date: vin.order_date
      Invoice Date: vin.invoice_date
    row: 4
    col: 12
    width: 7
    height: 5
  - title: Les 10 premiers modèles classés par le prix
    name: Les 10 premiers modèles classés par le prix
    model: formation_looker
    explore: vin
    type: looker_wordcloud
    fields: [vin.model, vin.max_catalogue_price]
    sorts: [vin.max_catalogue_price desc 0]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: FuelFrancais
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: fuelfrancais
      args:
      - vin.fuel_type
      - - label: Gasoil
          filter: DIESEL
        - label: Electrique
          filter: ELECTRIC
        - label: Essence
          filter: PETROL
        - label: GAZ
          filter: PETROL CNGGAZ,PETROL LPG
      -
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: concat(${vin.model},"-",${vin.version})
      label: concat
      value_format:
      value_format_name:
      dimension: concat
      _kind_hint: dimension
      _type_hint: string
    - category: measure
      expression: ''
      label: Min of Catalogue Price
      value_format:
      value_format_name: eur
      based_on: vin.catalogue_price
      _kind_hint: measure
      measure: min_of_catalogue_price
      type: min
      _type_hint: number
    - category: measure
      expression: ''
      label: Max of Catalogue Price
      value_format:
      value_format_name: eur
      based_on: vin.catalogue_price
      _kind_hint: measure
      measure: max_of_catalogue_price
      type: max
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Catalogue Price
      value_format:
      value_format_name: eur
      based_on: vin.catalogue_price
      _kind_hint: measure
      measure: average_of_catalogue_price
      type: average
      _type_hint: number
    - category: dimension
      expression: diff_days(${vin.order_date},${vin.invoice_date})
      label: diff days
      value_format:
      value_format_name:
      dimension: diff_days
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Min of diff days
      value_format:
      value_format_name: decimal_0
      based_on: diff_days
      _kind_hint: measure
      measure: min_of_diff_days
      type: min
      _type_hint: number
    - category: measure
      expression: ''
      label: Max of diff days
      value_format:
      value_format_name: decimal_0
      based_on: diff_days
      _kind_hint: measure
      measure: max_of_diff_days
      type: max
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of diff days
      value_format:
      value_format_name: decimal_0
      based_on: diff_days
      _kind_hint: measure
      measure: average_of_diff_days
      type: average
      _type_hint: number
    - args:
      - vin.max_catalogue_price
      calculation_type: rank_of_column
      category: table_calculation
      based_on: vin.max_catalogue_price
      label: Rank of Vin max catalogue price
      source_field: vin.max_catalogue_price
      table_calculation: rank_of_vin_max_catalogue_price
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
        reverse: true
    rotation: false
    advanced_vis_config: |-
      {
        chart: {},
        series: [{
          animation:true,
        }]
      }
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [vin.max_catalogue_price]
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Brand: vin.brand
      Order Date: vin.order_date
      Invoice Date: vin.invoice_date
    row: 20
    col: 2
    width: 9
    height: 11
  - title: Le pourcentage du nombre de véhicules réparti par type de carburant
    name: Le pourcentage du nombre de véhicules réparti par type de carburant
    model: formation_looker
    explore: vin
    type: looker_pie
    fields: [vin.fuel_type_fr, vin.count]
    fill_fields: [vin.fuel_type_fr]
    sorts: [vin.count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: FuelFrancais
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: fuelfrancais
      args:
      - vin.fuel_type
      - - label: Gasoil
          filter: DIESEL
        - label: Electrique
          filter: ELECTRIC
        - label: Essence
          filter: PETROL
        - label: GAZ
          filter: PETROL CNGGAZ,PETROL LPG
      -
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: concat(${vin.model},"-",${vin.version})
      label: concat
      value_format:
      value_format_name:
      dimension: concat
      _kind_hint: dimension
      _type_hint: string
    - category: measure
      expression: ''
      label: Min of Catalogue Price
      value_format:
      value_format_name: eur
      based_on: vin.catalogue_price
      _kind_hint: measure
      measure: min_of_catalogue_price
      type: min
      _type_hint: number
    - category: measure
      expression: ''
      label: Max of Catalogue Price
      value_format:
      value_format_name: eur
      based_on: vin.catalogue_price
      _kind_hint: measure
      measure: max_of_catalogue_price
      type: max
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Catalogue Price
      value_format:
      value_format_name: eur
      based_on: vin.catalogue_price
      _kind_hint: measure
      measure: average_of_catalogue_price
      type: average
      _type_hint: number
    - category: dimension
      expression: diff_days(${vin.order_date},${vin.invoice_date})
      label: diff days
      value_format:
      value_format_name:
      dimension: diff_days
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Min of diff days
      value_format:
      value_format_name: decimal_0
      based_on: diff_days
      _kind_hint: measure
      measure: min_of_diff_days
      type: min
      _type_hint: number
    - category: measure
      expression: ''
      label: Max of diff days
      value_format:
      value_format_name: decimal_0
      based_on: diff_days
      _kind_hint: measure
      measure: max_of_diff_days
      type: max
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of diff days
      value_format:
      value_format_name: decimal_0
      based_on: diff_days
      _kind_hint: measure
      measure: average_of_diff_days
      type: average
      _type_hint: number
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Brand: vin.brand
      Order Date: vin.order_date
      Invoice Date: vin.invoice_date
    row: 20
    col: 12
    width: 9
    height: 11
  - title: ''
    name: ''
    model: formation_looker
    explore: vin
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [vin.max_dif, vin.avg_dif]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    title_override_vin.max_dif: Max jours en Stock
    title_override_vin.avg_dif: Average jours en Stock
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    defaults_version: 0
    listen:
      Brand: vin.brand
      Order Date: vin.order_date
      Invoice Date: vin.invoice_date
    row: 9
    col: 3
    width: 17
    height: 5
  - title: ''
    name: " (2)"
    model: formation_looker
    explore: vin
    type: looker_column
    fields: [vin.brand, vin.fuel_type_fr, vin.count]
    filters: {}
    sorts: [vin.count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: FuelFrancais
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: fuelfrancais
      args:
      - vin.fuel_type
      - - label: Gasoil
          filter: DIESEL
        - label: Electrique
          filter: ELECTRIC
        - label: Essence
          filter: PETROL
        - label: GAZ
          filter: PETROL CNGGAZ,PETROL LPG
      -
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: concat(${vin.model},"-",${vin.version})
      label: concat
      value_format:
      value_format_name:
      dimension: concat
      _kind_hint: dimension
      _type_hint: string
    - category: measure
      expression: ''
      label: Min of Catalogue Price
      value_format:
      value_format_name: eur
      based_on: vin.catalogue_price
      _kind_hint: measure
      measure: min_of_catalogue_price
      type: min
      _type_hint: number
    - category: measure
      expression: ''
      label: Max of Catalogue Price
      value_format:
      value_format_name: eur
      based_on: vin.catalogue_price
      _kind_hint: measure
      measure: max_of_catalogue_price
      type: max
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Catalogue Price
      value_format:
      value_format_name: eur
      based_on: vin.catalogue_price
      _kind_hint: measure
      measure: average_of_catalogue_price
      type: average
      _type_hint: number
    - category: dimension
      expression: diff_days(${vin.order_date},${vin.invoice_date})
      label: diff days
      value_format:
      value_format_name:
      dimension: diff_days
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Min of diff days
      value_format:
      value_format_name: decimal_0
      based_on: diff_days
      _kind_hint: measure
      measure: min_of_diff_days
      type: min
      _type_hint: number
    - category: measure
      expression: ''
      label: Max of diff days
      value_format:
      value_format_name: decimal_0
      based_on: diff_days
      _kind_hint: measure
      measure: max_of_diff_days
      type: max
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of diff days
      value_format:
      value_format_name: decimal_0
      based_on: diff_days
      _kind_hint: measure
      measure: average_of_diff_days
      type: average
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: vin.count, id: vin.count,
            name: Vin}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors: {}
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: center,
        color: "#000000", label: '', value_format: ''}, {reference_type: range, line_value: mean,
        range_start: max, range_end: mean, margin_top: deviation, margin_value: mean,
        margin_bottom: deviation, label_position: right, color: "#1aa82e"}, {reference_type: range,
        line_value: mean, range_start: mean, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#DB5839",
        label: ''}]
    defaults_version: 1
    listen:
      Brand: vin.brand
      Order Date: vin.order_date
      Invoice Date: vin.invoice_date
    row: 38
    col: 0
    width: 21
    height: 9
  - title: ''
    name: " (3)"
    model: formation_looker
    explore: vin
    type: looker_grid
    fields: [vin.brand, vin.order_month, vin.type_de_carburant, vin.count]
    pivots: [vin.order_month]
    fill_fields: [vin.order_month]
    filters:
      vin.order_year: '2019'
    sorts: [vin.order_month, vin.count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: FuelFrancais
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: fuelfrancais
      args:
      - vin.fuel_type
      - - label: Gasoil
          filter: DIESEL
        - label: Electrique
          filter: ELECTRIC
        - label: Essence
          filter: PETROL
        - label: GAZ
          filter: PETROL CNGGAZ,PETROL LPG
      -
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: concat(${vin.model},"-",${vin.version})
      label: concat
      value_format:
      value_format_name:
      dimension: concat
      _kind_hint: dimension
      _type_hint: string
    - category: measure
      expression: ''
      label: Min of Catalogue Price
      value_format:
      value_format_name: eur
      based_on: vin.catalogue_price
      _kind_hint: measure
      measure: min_of_catalogue_price
      type: min
      _type_hint: number
    - category: measure
      expression: ''
      label: Max of Catalogue Price
      value_format:
      value_format_name: eur
      based_on: vin.catalogue_price
      _kind_hint: measure
      measure: max_of_catalogue_price
      type: max
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Catalogue Price
      value_format:
      value_format_name: eur
      based_on: vin.catalogue_price
      _kind_hint: measure
      measure: average_of_catalogue_price
      type: average
      _type_hint: number
    - category: dimension
      expression: diff_days(${vin.order_date},${vin.invoice_date})
      label: diff days
      value_format:
      value_format_name:
      dimension: diff_days
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Min of diff days
      value_format:
      value_format_name: decimal_0
      based_on: diff_days
      _kind_hint: measure
      measure: min_of_diff_days
      type: min
      _type_hint: number
    - category: measure
      expression: ''
      label: Max of diff days
      value_format:
      value_format_name: decimal_0
      based_on: diff_days
      _kind_hint: measure
      measure: max_of_diff_days
      type: max
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of diff days
      value_format:
      value_format_name: decimal_0
      based_on: diff_days
      _kind_hint: measure
      measure: average_of_diff_days
      type: average
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      vin.count:
        is_active: true
        palette:
          palette_id: sofinco-diverging-0
          collection_id: sofinco
        value_display: true
    series_text_format:
      vin.brand:
        fg_color: "#eb3ac1"
      vin.type_de_carburant:
        fg_color: "#03a7b1"
      vin.order_month:
        fg_color: "#DB5839"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Brand: vin.brand
      Order Date: vin.order_date
      Invoice Date: vin.invoice_date
    row: 31
    col: 0
    width: 21
    height: 7
  - title: Logo
    name: Logo
    model: formation_looker
    explore: vin
    type: single_value
    fields: [vin.brand_logo]
    filters: {}
    sorts: [vin.brand_logo]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: FuelFrancais
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: fuelfrancais
      args:
      - vin.fuel_type
      - - label: Gasoil
          filter: DIESEL
        - label: Electrique
          filter: ELECTRIC
        - label: Essence
          filter: PETROL
        - label: GAZ
          filter: PETROL CNGGAZ,PETROL LPG
      -
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: concat(${vin.model},"-",${vin.version})
      label: concat
      value_format:
      value_format_name:
      dimension: concat
      _kind_hint: dimension
      _type_hint: string
    - category: measure
      expression: ''
      label: Min of Catalogue Price
      value_format:
      value_format_name: eur
      based_on: vin.catalogue_price
      _kind_hint: measure
      measure: min_of_catalogue_price
      type: min
      _type_hint: number
    - category: measure
      expression: ''
      label: Max of Catalogue Price
      value_format:
      value_format_name: eur
      based_on: vin.catalogue_price
      _kind_hint: measure
      measure: max_of_catalogue_price
      type: max
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Catalogue Price
      value_format:
      value_format_name: eur
      based_on: vin.catalogue_price
      _kind_hint: measure
      measure: average_of_catalogue_price
      type: average
      _type_hint: number
    - category: dimension
      expression: diff_days(${vin.order_date},${vin.invoice_date})
      label: diff days
      value_format:
      value_format_name:
      dimension: diff_days
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Min of diff days
      value_format:
      value_format_name: decimal_0
      based_on: diff_days
      _kind_hint: measure
      measure: min_of_diff_days
      type: min
      _type_hint: number
    - category: measure
      expression: ''
      label: Max of diff days
      value_format:
      value_format_name: decimal_0
      based_on: diff_days
      _kind_hint: measure
      measure: max_of_diff_days
      type: max
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of diff days
      value_format:
      value_format_name: decimal_0
      based_on: diff_days
      _kind_hint: measure
      measure: average_of_diff_days
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Brand: vin.brand
      Order Date: vin.order_date
      Invoice Date: vin.invoice_date
    row: 4
    col: 5
    width: 4
    height: 5
  - title: ''
    name: " (4)"
    model: formation_looker
    explore: vin
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [vin.Max_Catalogue_Price, vin.Min_Catalogue_Price, vin.Avg_Catalog_Price]
    filters:
      vin.brand: RENAULT
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size_main: '20'
    orientation: auto
    style_vin.Max_Catalogue_Price: "#3A4245"
    show_title_vin.Max_Catalogue_Price: true
    title_placement_vin.Max_Catalogue_Price: above
    value_format_vin.Max_Catalogue_Price: ''
    style_vin.Min_Catalogue_Price: "#3A4245"
    show_title_vin.Min_Catalogue_Price: true
    title_placement_vin.Min_Catalogue_Price: above
    value_format_vin.Min_Catalogue_Price: ''
    show_comparison_vin.Min_Catalogue_Price: false
    style_vin.Avg_Catalog_Price: "#3A4245"
    show_title_vin.Avg_Catalog_Price: true
    title_override_vin.Avg_Catalog_Price: Avg Catalogue price
    title_placement_vin.Avg_Catalog_Price: above
    value_format_vin.Avg_Catalog_Price: ''
    show_comparison_vin.Avg_Catalog_Price: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 0
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen: {}
    row: 14
    col: 1
    width: 22
    height: 6
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: <img src="https://www.jems-group.com/wp-content/uploads/2022/02/Logo-JEMS-RVB-avec-baseline.png"  width="250"
      height="100"/>
    row: 0
    col: 19
    width: 5
    height: 4
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |2+

      <nav style=" background-color:#000;font-size: 30px; padding: 10px; height: 150px" >
      <a style="color: #00F; padding: 5px 15px; float: left; line-height: 20px; " href="https://jemsgroup.cloud.looker.com/dashboards/159?Brand=RENAULT&Invoice+Date=2019%2F01%2F01+to+2023%2F11%2F19&Order+Date=2019%2F01%2F01+to+2020%2F12%2F31" >Vin</a>
      <a style="color:#fff; padding: 5px 15px; float: left; line-height: 20px;" href="https://jemsgroup.cloud.looker.com/dashboards/180?Date+Accident+Date=2019%2F01%2F01+to+2020%2F01%2F01" > Accidents</a>
      <a style="color:red; padding: 5px 15px; float: left; line-height: 20px;" href="https://jemsgroup.cloud.looker.com/dashboards/25?Type+De+Restitution=Lancement&Robustesse=Toutes%5E_Robustesse&Type+De+Rendu=nombre&Date+Granularity=week&Nature+D+Incident=All&NITG=&Date+de+cr%C3%A9ation=2020%2F01%2F01+to+2022%2F08%2F25&Garantie+Year=&V%C3%A9hicule+-+Projet=&GSFA=&Mis+Alliance=%5B0%2C100%5D&V%C3%A9hicule+-+Usine=&Pays+de+Livraison=&V%C3%A9hicule+-+Model=&Date+de+Fabrication=10+year&Date+de+Livraison=10+year" > One page</a>
      <TD>
      <img src="https://zupimages.net/up/22/35/4nj3.png" width="1920" /> </TD>
      </nav>



    row: 0
    col: 1
    width: 18
    height: 4
  filters:
  - name: Brand
    title: Brand
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: true
    ui_config:
      type: button_toggles
      display: inline
      options:
      - ALPINE
      - DACIA
      - RENAULT
    model: formation_looker
    explore: vin
    listens_to_filters: []
    field: vin.brand
  - name: Order Date
    title: Order Date
    type: field_filter
    default_value: 2019/01/01 to 2020/12/31
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: formation_looker
    explore: vin
    listens_to_filters: []
    field: vin.order_date
  - name: Invoice Date
    title: Invoice Date
    type: field_filter
    default_value: 2019/01/01 to 2023/11/19
    allow_multiple_values: true
    required: true
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: formation_looker
    explore: vin
    listens_to_filters: []
    field: vin.invoice_date
