## libraries
library(ggplot2)
library(ggpubr)
library(R.utils)


# load necessary functions
sourceDirectory('/Users/eaperkowski/git/optimal_vcmax_R/functions', modifiedOnly = FALSE)
source("/Users/eaperkowski/git/optimal_vcmax_R/calc_optimal_vcmax.R")

hyp.fig <- calc_optimal_vcmax(beta = seq(70, 550, 10))

beta.fig <- ggplot(data = hyp.fig, aes(x = beta, y = nall)) +
  geom_line(size = 2) +
  labs(x = expression(beta),
       y = "Leaf N") +
  theme_bw(base_size = 30) +
  theme(panel.grid = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank())

chi.fig <- ggplot(data = hyp.fig, aes(x = beta, y = chi)) +
  geom_line(size = 2) +
  geom_line(y = wue)
  labs(x = expression(beta),
       y = expression(chi)) +
  theme_bw(base_size = 30) +
  theme(panel.grid = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank())

png("/Users/eaperkowski/git/esa2022_talk/beta_hypothesis_fig.png",
    width = 4, height = 4, units = 'in', res = 600)
beta.fig
dev.off()

png("/Users/eaperkowski/git/esa2022_talk/chi_hypothesis_fig.png",
    width = 4, height = 4, units = 'in', res = 600)
chi.fig
dev.off()

