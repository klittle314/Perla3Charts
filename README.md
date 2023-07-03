# Perla, Provost, and Murray style Charts

In 2011, Perla, Provost and Murray published an article that promotes the use of run charts as an accessible and powerful tool (Perla, R. J., Provost, L. P., Murray, S. K. The run chart: a simple analytical tool for learning from variation in healthcare processes. BMJ Quality & Safety, 2011, 20, pp. 46-51). 

While the main point of the article describes probability-based rules to identify unusual patterns of runs in time-series plots, the authors present a triplet of graphs that demonstrates the importance of time-order plots in assessing evidence for a change in a system's performance.  

The Perla, Provost, and Murray presentation recalls the graphical example provided by Frank Anscombe, known as Anscombe's quartet:  four graphs with very different appearances that yield the same statistical summaries.  Click [here](https://en.wikipedia.org/wiki/Anscombe%27s_quartet) for the Wikipedia entry.

I created an RMarkdown script to generate examples similar to the Perla, Provost and Murray triplet.  The script allows the user to create graphs with "up" or "down" as the good direction and to customize variable name and unit lable to match a user's situation.

*Contents of the repository:*
1. images folder:  contains .png file of the Model for Improvement
2. Interactive_ChartMaker.Rmd:  A script that will allow a user to interact to define the format of the triplet of graphs.
3. May2023RunChartMarkdown.Rmd:  A script that produces a plain vanilla PowerPoint deck that presents the triplet of graphs and supporting information.
4. May2023RunChartMarkdown.pptx:  Output from May2023RunChartMarkdown.Rmd.
5. May2023RunChartMarkdownWORD.Rmd:  A script that produces the draft of my July 2023 blog post on the triplet of graphs.
6. helper.R:  A script with two helper functions.
