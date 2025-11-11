# Initial analyses of fungal AMR metadata

### install packages
#install.packages("reshape")
#install.packages("ggplot2")
#install.packages("tidyr")
#install.packages("dplyr")
#install.packages ("readxl")

# Load packages
library(reshape)
library(tidyr)
library(ggplot2)
library(dplyr)
library(readxl)

#Set working dir
setwd("~/Dropbox/fungal_ecology_lab/members/teddy/FungAMR_FEL_analyses/RStudio/")

# load data
Fungal_AMR <- read.csv("~/Dropbox/fungal_ecology_lab/members/teddy/FungAMR_FEL_analyses/metadata/FungAMR_081024.csv", header = T)
Fungal_AMR
length(Fungal_AMR$X)
summary(Fungal_AMR)
colnames(Fungal_AMR)


### Summarize and plot by relevant categories
summary_df <- Fungal_AMR %>%
  count(species, name = "count") %>%
  filter(count >= 10)

print(summary_df)

# Plot
ggplot(summary_df, aes(x = reorder(species, -count), y = count, fill = species)) +
  scale_y_log10()+
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Species Counts", x = "Species", y = "Log(Count)") +
  theme(legend.position = "none",
    axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1))


summary_df_byDrug <- Fungal_AMR %>%
  group_by(drug) %>%
  count(species, name = "count") %>%
  filter(count >= 5)

ggplot(summary_df_byDrug, aes(x = reorder(drug, -count), y = count, fill = species)) +
  scale_y_log10()+
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Species Counts", x = "Drug Name", y = "Log(Count)") +
  theme(legend.position = "top",
        axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1))



summary_df_byDrugByGene <- Fungal_AMR %>%
  group_by(drug, gene.or.protein.name) %>%
  count(species, name = "count") %>%
  filter(count >= 2)


ggplot(summary_df_byDrugByGene, aes(x = reorder(gene.or.protein.name, -count), y = count, fill = species)) +
  scale_y_log10()+
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Species Counts", x = "Gene or Protein Name", y = "Log(Count)") +
  theme(legend.position = "top", axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1))


summary_df_byYearDrugByGene <- Fungal_AMR %>%
  group_by(year, drug, gene.or.protein.name) %>%
  count(species, name = "count") %>%
  filter(count >= 2)

ggplot(summary_df_byYearDrugByGene, aes(x = reorder(gene.or.protein.name, -count), y = count, fill = species)) +
  scale_y_log10()+
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Species Counts", x = "Gene or Protein Name", y = "Log(Count)") +
  theme(legend.position = "top", axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1, size = 4)) +
  facet_grid(~year)
  

ggplot(summary_df_byYearDrugByGene, aes(x = year, y = count, color = gene.or.protein.name)) +
  geom_line(linewidth = 1) +
  geom_point() +
  facet_wrap(~species, ncol = 6, scales = "free_y") +
  #theme(strip.text = element_text(size= 4)) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1, size = 7))+
  theme(axis.text.y = element_text(hjust = 1, vjust = 1, size = 7))+
  theme(legend.text = element_text(size = 7))+
  labs(
    title = "Temporal trends of AMR genes by species",
    x = "Year",
    y = "Count",
    color = "Gene/Protein"
  )


summary_df_byYearDrugByGene_lessthan5 <- Fungal_AMR %>%
  group_by(year, drug, gene.or.protein.name) %>%
  count(species, name = "count") %>%
  filter(count < 5)

ggplot(summary_df_byYearDrugByGene_lessthan5, aes(x = reorder(gene.or.protein.name, -count), y = count, fill = species)) +
  #scale_y_log10()+
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Species Counts", x = "Gene or Protein Name", y = "Log(Count)") +
  theme(legend.position = "top", axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1, size = 4)) +
  facet_grid(~year)

ggplot(summary_df_byYearDrugByGene_lessthan5, aes(x = year, y = count, color = gene.or.protein.name)) +
  geom_line(linewidth = 0.5) +
  geom_point() +
  facet_wrap(~species, scales = "free_y") +
  theme_minimal() +
  theme(legend.position = "top", axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1, size = 4)) +
  labs(
    title = "Temporal trends of AMR genes by species",
    x = "Year",
    y = "Count",
    color = "Gene/Protein"
  )



summary_df_byOriginYearDrugByGene_morethan10 <- Fungal_AMR %>%
  group_by(strain.origin.if.available, year) %>%
  count(drug, name = "count") %>%
  filter(count >= 10)

ggplot(summary_df_byOriginYearDrugByGene_morethan10, aes(x = reorder(strain.origin.if.available, -count), y = count, fill = drug)) +
  scale_y_log10()+
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Species Counts", x = "Gene or Protein Name", y = "Log(Count)") +
  theme(legend.position = "top", axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1, size = 10)) +
  facet_grid(~year)


#Plot by species, drug, and year
summary_df_bySpeciesYearDrugByGene <- Fungal_AMR %>%
  group_by(species, year) %>%
  count(drug, name = "count")%>%
  filter(count >= 2)

ggplot(summary_df_bySpeciesYearDrugByGene, 
       aes(x = reorder(species, -count), y = count, fill = drug)) +
  geom_bar(stat = "identity") +
  scale_y_log10() +
  labs(title = "Counts by year and species", x = "Species", y = "Log(Count)") +
  facet_grid(~year, scales = "free") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1, size = 3),
    legend.position = "bottom",
    legend.justification = "center",       # centers multi-row legend
    legend.text = element_text(size = 5),
    legend.title = element_text(size = 5),
    legend.spacing.x = unit(0.3, "cm"),
    legend.box.margin = margin(0,0,0,0),
    legend.box.background = element_rect(fill = "transparent", color = NA)
  ) +
  guides(
    fill = guide_legend(
      nrow = 4,                    # allow 2 rows (adjust as needed)
      byrow = TRUE,
      title.position = "top",
      label.position = "bottom",
      keywidth = unit(1, "cm"),    # smaller boxes to fit more items
      keyheight = unit(0.6, "cm")
    )
  )

#Plot by species, drug, and year (more than 10 per category)
summary_df_bySpeciesYearDrugByGene_morethan10 <- Fungal_AMR %>%
  group_by(species, year) %>%
  count(drug, name = "count") %>%
  filter(count >= 10)

ggplot(summary_df_bySpeciesYearDrugByGene_morethan10, aes(x = reorder(species, -count), y = count, fill = drug)) +
  scale_y_log10()+
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Species Counts", x = "Gene or Protein Name", y = "Log(Count)") +
  theme(legend.position = "top", axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1, size = 6)) +
  facet_grid(~year, scales = "free")



#####Heatmap
summary_df_byYearDrugByGene_forHeatMap <- Fungal_AMR %>%
  group_by(year, drug, gene.or.protein.name) %>%
  count(species, name = "count") #%>%
  #filter(count < 5)


ggplot(summary_df_byYearDrugByGene_forHeatMap,
       aes(x = factor(year), y = gene.or.protein.name, fill = count)) +
  geom_tile(color = "white") +
  #scale_y_log10() +
  facet_wrap(~species) +
  scale_fill_gradientn(
    colours = c("steelblue", "lightblue", "orange", "red"),
    breaks = seq(0, max(summary_df_byYearDrugByGene_forHeatMap$count, na.rm = TRUE), by = 100),
    name = "Count"
  ) +
  theme_minimal() +
  labs(
    title = "Heatmap of AMR gene occurrences by year and species",
    x = "Year",
    y = "Gene/Protein"
  )



summary_df_byYearDrugByGene_forHeatMap <- Fungal_AMR %>%
  group_by(year, drug, gene.or.protein.name) %>%
  count(species, name = "count") %>%
  filter(count >= 1)

summary_df_byYearDrugByGene_forHeatMap <- summary_df_byYearDrugByGene_forHeatMap %>%
  mutate(count_bin = cut(
    count,
    breaks = c(0, 1, 10, 20, 30, 40, Inf),
    labels = c("0", "1–10", "11–20", "21-30","31-40", ">40")
  ))

ggplot(summary_df_byYearDrugByGene_forHeatMap,
       aes(x = factor(year), y = gene.or.protein.name, fill = count_bin)) +
  geom_tile(color = "white") +
  theme(legend.position = "top", axis.text.x = element_text(hjust = 1, vjust = 1, size = 3))+
  theme(axis.text.y = element_text(angle = 45, hjust = 1, vjust = 1, size = 3))+
  facet_wrap(~species, ncol = 4 ) +
  scale_fill_brewer(palette = "YlOrRd", name = "Count range") +
  theme_minimal() +
  labs(
    title = "Heatmap of AMR gene occurrences by year and species",
    x = "Year",
    y = "Gene/Protein"
  )



#summary_df2 <- Fungal_AMR %>%
 # group_by(year, gene.or.protein.name, species) %>%
  #summarise(total_count = unique(count), .groups = "drop")

