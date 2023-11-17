---
- dashboard: vhicule
  title: Véhicule
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: 9g8c50BIcOXBC0rNSSij3B
  elements:
  - title: Number of models
    name: Number of models
    model: formation_looker
    explore: vin
    type: single_value
    fields: [vin.count_distinct_model, vin.count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
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
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    color_application: undefined
    listen:
      Brand: vin.brand
    row: 4
    col: 0
    width: 5
    height: 4
  - title: Catalogue price
    name: Catalogue price
    model: formation_looker
    explore: vin
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [vin.Max_Catalogue_Price, vin.Min_Catalogue_Price, vin.Avg_Catalog_Price]
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
    listen:
      Brand: vin.brand
    row: 8
    col: 0
    width: 24
    height: 4
  - title: Stock (day)
    name: Stock (day)
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
    font_size_main: '20'
    orientation: horizontal
    dividers: false
    style_vin.max_dif: "#3A4245"
    show_title_vin.max_dif: true
    title_override_vin.max_dif: Max Stock
    title_placement_vin.max_dif: above
    value_format_vin.max_dif: ''
    style_vin.avg_dif: "#3A4245"
    show_title_vin.avg_dif: true
    title_override_vin.avg_dif: Average stock
    title_placement_vin.avg_dif: above
    value_format_vin.avg_dif: ''
    show_comparison_vin.avg_dif: false
    style_vin.min_dif: "#3A4245"
    show_title_vin.min_dif: true
    title_override_vin.min_dif: Min days difference
    title_placement_vin.min_dif: above
    value_format_vin.min_dif: ''
    show_comparison_vin.max_dif: false
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
    color_application: undefined
    groupBars: true
    labelSize: 10pt
    showLegend: true
    listen:
      Brand: vin.brand
    row: 4
    col: 5
    width: 19
    height: 4
  - title: Brand image
    name: Brand image
    model: formation_looker
    explore: vin
    type: single_value
    fields: [vin.brand_image]
    filters: {}
    sorts: [vin.brand_image]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
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
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    ordering: none
    show_null_labels: false
    value_labels: legend
    label_type: labPer
    listen:
      Brand: vin.brand
    row: 0
    col: 0
    width: 6
    height: 4
  - title: Stock by model
    name: Stock by model
    model: formation_looker
    explore: vin
    type: looker_bar
    fields: [vin.model, vin.Stock]
    sorts: [vin.Stock desc 0]
    limit: 500
    column_limit: 50
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
    stacking: normal
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '15'
    hide_legend: false
    series_colors:
      vin.Stock: "#F9AB00"
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000", label: Avg_line}]
    column_group_spacing_ratio: 0
    defaults_version: 1
    listen:
      Brand: vin.brand
    row: 12
    col: 0
    width: 16
    height: 10
  - title: Margin rate by model
    name: Margin rate by model
    model: formation_looker
    explore: vin
    type: table
    fields: [vin.margin_rate, vin.model]
    sorts: [vin.margin_rate desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - args:
      - vin.margin_rate
      calculation_type: percent_of_column_sum
      category: table_calculation
      based_on: vin.margin_rate
      label: Percent of Vin Margin Rate
      source_field: vin.margin_rate
      table_calculation: percent_of_vin_margin_rate
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - args:
      - vin.margin_rate
      calculation_type: percent_of_column_sum
      category: table_calculation
      based_on: vin.margin_rate
      label: Percent of Vin Margin Rate
      source_field: vin.margin_rate
      table_calculation: percent_of_vin_margin_rate_2
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    series_labels: {}
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825, options: {steps: 5, mirror: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
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
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    hidden_points_if_no: []
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Brand: vin.brand
    row: 12
    col: 16
    width: 8
    height: 10
  filters:
  - name: Brand
    title: Brand
    type: field_filter
    default_value: RENAULT
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: formation_looker
    explore: vin
    listens_to_filters: []
    field: vin.brand
