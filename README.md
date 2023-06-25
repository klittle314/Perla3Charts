# Perla, Provost, and Murray style Charts

Perla, R. J., Provost, L. P., Murray, S. K. The run chart: a simple analytical tool for learning from variation in healthcare processes. 
BMJ Quality & Safety, 2011, 20, pp. 46-51 shows a triplet of graphs that have identical summary statistics.

While the main point of the article describes probability-based rules to identify unusual patterns of runs in time-series plots, the triplet of graphs demonstrates the importance of time-order plots in assessing evidence for a change in a system's performance.  

The Perla, Provost, and Murray presentation recalls the graphical example provided by Frank Anscombe, known as Anscombe's quartet:  four graphs with very different appearances that yield the same statistical summaries.  Click [here](https://en.wikipedia.org/wiki/Anscombe%27s_quartet) for the Wikipedia entry.

I created an RMarkdown script to generate examples similar to the Perla, Provost and Murray triplet.  The script allows the user to create graphs with "up" or "down" as the good direction and to customize variable name and unit lable to match a user's situation.
