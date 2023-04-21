test_that("hp returns correct number of colors", {
  expect_equal(kg_create_tc("yellow")[[1]],
               c("#FF00FFFF", "#FFFF00FF", "#00FFFFFF"))

})
