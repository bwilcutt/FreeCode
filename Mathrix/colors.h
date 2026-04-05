#ifndef COLORS_H
#define COLORS_H

/*************************************************************
 * colors.h — Mathrix centralized color palette
 *
 * Theme: Catppuccin Macchiato
 * https://github.com/catppuccin/catppuccin
 *
 * Every color used in Mathrix is defined here exactly once.
 * Two forms are provided for each color:
 *
 *   MX_<NAME>          — hex string "#rrggbb" for GTK CSS
 *   MX_<NAME>_R/G/B    — float 0..1 triplet for Cairo
 *   MX_<NAME>_A        — float alpha (where applicable)
 *
 * To change the theme, edit only this file.
 *************************************************************/

/* Crust — darkest background, titlebar */
#define MX_CRUST            "#181926"
#define MX_CRUST_R           0.094
#define MX_CRUST_G           0.098
#define MX_CRUST_B           0.149

/* Mantle — panel backgrounds, menubar */
#define MX_MANTLE           "#1e2030"
#define MX_MANTLE_R          0.118
#define MX_MANTLE_G          0.125
#define MX_MANTLE_B          0.188

/* Base — main window background */
#define MX_BASE             "#24273a"
#define MX_BASE_R            0.141
#define MX_BASE_G            0.153
#define MX_BASE_B            0.227

/* Surface0 — borders, separators, grid lines */
#define MX_SURFACE0         "#363a4f"
#define MX_SURFACE0_R        0.212
#define MX_SURFACE0_G        0.227
#define MX_SURFACE0_B        0.310

/* Surface1 — input field borders, secondary borders */
#define MX_SURFACE1         "#494d64"
#define MX_SURFACE1_R        0.286
#define MX_SURFACE1_G        0.302
#define MX_SURFACE1_B        0.392

/* Surface2 — hover states, selected rows */
#define MX_SURFACE2         "#5b6078"
#define MX_SURFACE2_R        0.357
#define MX_SURFACE2_G        0.376
#define MX_SURFACE2_B        0.471

/* Text — primary text, input values */
#define MX_TEXT             "#cad3f5"
#define MX_TEXT_R            0.792
#define MX_TEXT_G            0.827
#define MX_TEXT_B            0.961

/* Subtext1 — secondary text, parameter labels */
#define MX_SUBTEXT1         "#b8c0e0"
#define MX_SUBTEXT1_R        0.722
#define MX_SUBTEXT1_G        0.753
#define MX_SUBTEXT1_B        0.878

/* Subtext0 — muted text, descriptions */
#define MX_SUBTEXT0         "#a5adcb"
#define MX_SUBTEXT0_R        0.647
#define MX_SUBTEXT0_G        0.678
#define MX_SUBTEXT0_B        0.796

/* Overlay2 — dimmed text, placeholders */
#define MX_OVERLAY2         "#939ab7"
#define MX_OVERLAY2_R        0.576
#define MX_OVERLAY2_G        0.604
#define MX_OVERLAY2_B        0.718

/* Overlay1 — axis lines, subtle UI chrome */
#define MX_OVERLAY1         "#8087a2"
#define MX_OVERLAY1_R        0.502
#define MX_OVERLAY1_G        0.529
#define MX_OVERLAY1_B        0.635

/* Overlay0 — status bar text, zero lines */
#define MX_OVERLAY0         "#6e738d"
#define MX_OVERLAY0_R        0.431
#define MX_OVERLAY0_G        0.451
#define MX_OVERLAY0_B        0.553

/* Blue — primary accent, form titles, headerbar text, Run button */
#define MX_BLUE             "#8aadf4"
#define MX_BLUE_R            0.541
#define MX_BLUE_G            0.678
#define MX_BLUE_B            0.957

/* Sapphire — line plots, graph toolbar title */
#define MX_SAPPHIRE         "#7dc4e4"
#define MX_SAPPHIRE_R        0.490
#define MX_SAPPHIRE_G        0.769
#define MX_SAPPHIRE_B        0.894

/* Sky — line plot fill, secondary accents */
#define MX_SKY              "#91d7e3"
#define MX_SKY_R             0.569
#define MX_SKY_G             0.843
#define MX_SKY_B             0.890

/* Teal — Plot button gradient end */
#define MX_TEAL             "#8bd5ca"
#define MX_TEAL_R            0.545
#define MX_TEAL_G            0.835
#define MX_TEAL_B            0.792

/* Green — Plot button gradient start, maximize button */
#define MX_GREEN            "#a6da95"
#define MX_GREEN_R           0.651
#define MX_GREEN_G           0.855
#define MX_GREEN_B           0.584

/* Yellow — dot caps on stem plots, minimize button */
#define MX_YELLOW           "#eed49f"
#define MX_YELLOW_R          0.933
#define MX_YELLOW_G          0.831
#define MX_YELLOW_B          0.624

/* Peach — stem plots */
#define MX_PEACH            "#f5a97f"
#define MX_PEACH_R           0.961
#define MX_PEACH_G           0.663
#define MX_PEACH_B           0.498

/* Mauve — future use / alternate accent */
#define MX_MAUVE            "#c6a0f6"
#define MX_MAUVE_R           0.776
#define MX_MAUVE_G           0.627
#define MX_MAUVE_B           0.965

/* Red — close button, errors */
#define MX_RED              "#ed8796"
#define MX_RED_R             0.929
#define MX_RED_G             0.529
#define MX_RED_B             0.588
#define MX_BLACK            "#000000"

/* Window / panel backgrounds */
#define MX_WIN_BG           MX_BASE
#define MX_WIN_BG_R         MX_BASE_R
#define MX_WIN_BG_G         MX_BASE_G
#define MX_WIN_BG_B         MX_BASE_B

#define MX_PANEL_BG         MX_MANTLE
#define MX_PANEL_BG_R       MX_MANTLE_R
#define MX_PANEL_BG_G       MX_MANTLE_G
#define MX_PANEL_BG_B       MX_MANTLE_B

#define MX_INPUT_BG         MX_CRUST
#define MX_INPUT_BG_R       MX_CRUST_R
#define MX_INPUT_BG_G       MX_CRUST_G
#define MX_INPUT_BG_B       MX_CRUST_B

/* Borders */
#define MX_BORDER           MX_SURFACE0
#define MX_BORDER_FOCUS     MX_BLUE
#define MX_BORDER_INPUT     MX_SURFACE1

/* Primary text */
#define MX_PRIMARY_TEXT     MX_TEXT
#define MX_SECONDARY_TEXT   MX_SUBTEXT0
#define MX_MUTED_TEXT       MX_OVERLAY0

/* Titlebar */
#define MX_TITLEBAR_BG      MX_MANTLE
#define MX_TITLEBAR_TEXT    MX_BLUE

/* Graph plot roles */
#define MX_GRAPH_BG_R       MX_BASE_R
#define MX_GRAPH_BG_G       MX_BASE_G
#define MX_GRAPH_BG_B       MX_BASE_B

#define MX_GRAPH_PANEL_R    MX_MANTLE_R
#define MX_GRAPH_PANEL_G    MX_MANTLE_G
#define MX_GRAPH_PANEL_B    MX_MANTLE_B

#define MX_GRAPH_GRID_R     MX_SURFACE0_R
#define MX_GRAPH_GRID_G     MX_SURFACE0_G
#define MX_GRAPH_GRID_B     MX_SURFACE0_B
#define MX_GRAPH_GRID_A     0.7

#define MX_GRAPH_AXIS_R     MX_OVERLAY1_R
#define MX_GRAPH_AXIS_G     MX_OVERLAY1_G
#define MX_GRAPH_AXIS_B     MX_OVERLAY1_B

#define MX_GRAPH_TEXT_R     MX_TEXT_R
#define MX_GRAPH_TEXT_G     MX_TEXT_G
#define MX_GRAPH_TEXT_B     MX_TEXT_B

#define MX_GRAPH_TITLE_R    MX_BLUE_R
#define MX_GRAPH_TITLE_G    MX_BLUE_G
#define MX_GRAPH_TITLE_B    MX_BLUE_B

#define MX_GRAPH_LINE_R     MX_SAPPHIRE_R
#define MX_GRAPH_LINE_G     MX_SAPPHIRE_G
#define MX_GRAPH_LINE_B     MX_SAPPHIRE_B
#define MX_GRAPH_FILL_A     0.20

#define MX_GRAPH_STEM_R     MX_PEACH_R
#define MX_GRAPH_STEM_G     MX_PEACH_G
#define MX_GRAPH_STEM_B     MX_PEACH_B

#define MX_GRAPH_DOT_R      MX_YELLOW_R
#define MX_GRAPH_DOT_G      MX_YELLOW_G
#define MX_GRAPH_DOT_B      MX_YELLOW_B

#define MX_GRAPH_ZERO_R     MX_OVERLAY0_R
#define MX_GRAPH_ZERO_G     MX_OVERLAY0_G
#define MX_GRAPH_ZERO_B     MX_OVERLAY0_B
#define MX_GRAPH_ZERO_A     0.6

#endif /* COLORS_H */
