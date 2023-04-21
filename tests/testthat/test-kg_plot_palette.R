test_that("kg_plot_color", {
  vdiffr::expect_doppelganger("kg_plot_color_Amanohashidate",
                              kg_plot_color(name = "Amanohashidate", showcode = FALSE))
  vdiffr::expect_doppelganger("kg_create_cc",
                              kg_plot_color(color = kg_create_cc(c("#ff48ac", "yellow")),
                                            showcode = TRUE))
  vdiffr::expect_doppelganger("kg_create_tc", kg_create_tc("yellow"))
  vdiffr::expect_doppelganger("color_data", kg_plot_color(color = c("gray"), showcode = FALSE))
})
