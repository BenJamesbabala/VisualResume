% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/VisualResume_function.R
\name{VisualResume}
\alias{VisualResume}
\title{Creates a visual resume from dataframes specifying important events (e.g.; jobs or education) and interests / skills. The plot is optimized for an 8.5 in x 11 in display.}
\usage{
VisualResume(titles.left = c("Main Title", "Sub-title", "Sub-Sub-title"),
  titles.left.cex = c(4, 3, 2), titles.right = c("A", "B", "C"),
  titles.right.cex = c(4, 3, 2), timeline.labels = c("", ""),
  timeline = NULL, milestones = NULL, events = NULL, events.cex = 1.5,
  interests = NULL, font.family = NA, col = "xmen", trans = 0.6,
  year.steps = 1, year.range = NULL)
}
\arguments{
\item{titles.left, titles.right}{character. Vector of up to length three indicating labels to be shown in the top left / right.}

\item{titles.left.cex, titles.right.cex}{numeric. Vector indicating the size of the respective labels.}

\item{timeline.labels}{character. Vector of two labels for the top and bottom sections of the timeline.}

\item{timeline}{dataframe. Specifications of the elements in the timeline. See Details}

\item{milestones}{dataframe. Specifications of brief level-1 timeline milestones (at top of timeline). Should contain the columns \code{year} (integer) and \code{title} (character)}

\item{events}{dataframe. Specificaions of longer level-2 milestones (in bottom right plot). Should contain the columns \code{year} (integer) and \code{title} (character)}

\item{events.cex}{numeric. A size multiplier for level-2 milestones.}

\item{interests}{list. A list of length up to 4 indicating one's interests / skills. Each entry should be a character vector up to length 5. The more often a value occurs in the vector, the more pronounced it will be.}

\item{font.family}{character. An optional google font family. Run \code{sysfonts::font.families.google()} to see all of them. Only use when creating plot in a plotting device such as pdf()}

\item{col}{character. The color palette for the plot. Can be a named palette from the \code{yarrr::piratepal()} function (e.g.; \code{"basel"} or \code{"xmen"}), or a vector of named colors.}

\item{trans}{numeric. A number between 0 and 1 indicating the transparencies of the colors of boxes in the timeline.}

\item{year.steps}{integer. The step size in years of the year labels in the timeline.}

\item{year.range}{integer. A vector of minimum and maximum years to plot in the timeline.}
}
\description{
Creates a visual resume from dataframes specifying important events (e.g.; jobs or education) and interests / skills. The plot is optimized for an 8.5 in x 11 in display.
}
\details{
The argument \code{timeline} specifying events in the timeline should each be a dataframe with at least the following columns:
\describe{
 \item{title, sub}{character. Titles and subs}
 \item{start, end}{integer. Start and end years}
 \item{side}{binary. Vertical location of the event. 1 = top, 0 = bottom.}
 }
 If you want to adjust the locations of elements, you can specify the locations of timeline elements explicitly with additional named columns.
 \describe{
 \item{box.x0, box.x1, box.y0, box.y1}{numeric. Coordinates of the boxes.}
 \item{point.x, point.y}{numeric. Coordinates of the points.}
 \item{label.x, label.y}{numeric. Coordinates of the labels.}
 \item{label.dir}{string. Directions of the labels. Either "left" or "right".}
 }
 Note that the vertical axis of the timeline ranges from 0 (the bottom) to 100 (the top).
}
\examples{

# Walter White's visual resume

VisualResume(
titles.left = c("Walter White, PhD", "Chemistry, Cooking, Pizza", "*Built with love in R using the InfoResume package: www.ndphillips.github.io/inforesume"),
titles.right = c("www.lospolloshermanos.com", "TheOneWhoKnocks@gmail.com", "Full Resume: www.ndphillips.github.io"),
titles.right.cex = c(2, 2, 1),
titles.left.cex = c(4, 2, 1),
timeline.labels = c("Education", "Teaching"),
timeline = data.frame(title = c("Grinnell Col", "Ohio U", "U of Basel", "Max Planck Institute", "Old Van", "Gray Matter", "Sandia Laboratories", "J.P. Wynne High School", "A1A Car Wash"),
                     sub = c("BA. Student", "MS. Student", "PhD. Student", "PhD. Researcher", "Methamphetamine Research", "Co-Founder", "Chemist", "Chemistry Teacher", "Co-Owner"),
                     start = c(1976, 1980.1, 1982.2, 1985, 1996.5, 1987, 1991, 1995, 2001),
                     end = c(1980, 1982, 1985, 1987, 1998, 1992, 1995, 1998, 2003),
                     side = c(1, 1, 1, 1, 1, 0, 0, 0, 0)),
milestones = data.frame(title = c("BA", "MS", "PhD"),
                       sub = c("Mathematics", "Chemistry", "Chemistry"),
                       year = c(1980, 1982, 1985)),
events = data.frame(year = c(1985, 1995, 1997, 1999, 2012),
                   title = c("Contributed to Nobel Prize winning experiment.",
                             "Honorary mention for best Chemistry teacher of the year.",
                             "Created Blue Sky, the most potent methamphetamine ever produced.",
                             "Made first $1,000,000.",
                             "White, W., & Pinkman, J. (2012). Blue Sky: A method of [...].\\nJournal of Psychopharmical Substances, 1(1),.")),
interests = list("programming" = c(rep("R", 10), rep("Python", 1), rep("JavaScript", 2), "MatLab"),
                "statistics" = c(rep("Decision Trees", 10), rep("Bayesian", 5), rep("Regression", 3)),
                "leadership" = c(rep("Motivation", 10), rep("Decision Making", 5), rep("Manipulation", 30))),
year.steps = 2)

}

