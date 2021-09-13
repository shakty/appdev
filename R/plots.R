

install.packages("ggplot2")
library(ggplot2)
install.packages("ggpubr")
install.packages("stringr")
library(stringr)


## To save the plots in "plots" folder.
ifelse(!dir.exists(file.path("./plots")),
       dir.create(file.path("./plots")), FALSE)

## Please upload the necessary data and name it "data" as below.
##data <- read_csv("./data.csv")
n <- nrow(data)

###################

male <- sum(na.omit(str_count(data$gender.value, "Male")))
female <- sum(na.omit(str_count(data$gender.value, "Female")))
other <- sum(na.omit(str_count(data$gender.value, "Other")))


gender <- data.frame(label=c("Male","Female","Other"),value=c(male,female,other))

ggplot(gender, aes(x=label, y=value)) +
  geom_bar(stat = "identity",width=0.3) + theme_minimal() +
  ggtitle("What is your gender?") +  xlab("") + ylab("") +
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("./plots/gender.png", width = 20, height = 20, units = "cm")

####################
disciplines <- na.omit(unique(tolower(data$discipline.value)))

discipline <- data.frame(label= rep(NA,length(disciplines)),value=rep(NA,length(disciplines)))

for (i in 1:length(disciplines)) {

  discipline$label[i] <- disciplines[i]
  discipline$value[i] <- length(data$discipline.value[data$discipline.value == disciplines[i]])

}


ggplot(discipline, aes(x=label, y=value)) +
  geom_bar(stat = "identity",width=0.3) + theme_minimal() + coord_flip() +
  ggtitle('What is your core discipline?') +  xlab("") + ylab("") +
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("./plots/discipline.png", width = 30, height = 20, units = "cm")

################


bachelor <- sum(na.omit(str_count(data$grade.value, "Bachelor")))
master  <- sum(na.omit(str_count(data$grade.value, "Master")))
phD <- sum(na.omit(str_count(data$grade.value, "PhD")))
postGraduate <- sum(na.omit(str_count(data$grade.value, "Post")))
prof  <- sum(na.omit(str_count(data$grade.value, "Prof")))
dean <- sum(na.omit(str_count(data$grade.value, "Dean")))


grade <- data.frame(label=c('Bachelor', 'Master', 'PhD', 'Post Graduate', 'Prof', 'Dean'),
value=c(bachelor,master, phD, postGraduate, prof, dean))

ggplot(grade, aes(x=label, y=value))  +
  geom_bar(stat = "identity",width=0.3) + theme_minimal() +
  ggtitle("What is your highest academic grade?") +  xlab("") + ylab("") +
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("./plots/grade.png", width = 20, height = 20, units = "cm")

###################

JavaScript <- sum(na.omit(str_count(data$languages.value, "JavaScript")))
Stata  <- sum(na.omit(str_count(data$languages.value, "Stata")))
HTML  <- sum(na.omit(str_count(data$languages.value, "HTML")))
CSS <- sum(na.omit(str_count(data$languages.value, "CSS")))
Markdown <- sum(na.omit(str_count(data$languages.value, "Markdown")))
Python <- sum(na.omit(str_count(data$languages.value, "Python")))
Rust <- sum(na.omit(str_count(data$languages.value, "Rust")))
R <- (sum(na.omit(str_count(data$languages.value, "R"))) - Rust)
Java <- (sum(na.omit(str_count(data$languages.value, "Java"))) - JavaScript)
Matlab <- sum(na.omit(str_count(data$languages.value, "Matlab")))
Julia <- sum(na.omit(str_count(data$languages.value, "Julia")))
Scala <- sum(na.omit(str_count(data$languages.value, "Scala")))
Cplus <- sum(na.omit(str_count(data$languages.value, "\\++")))
C <- (sum(na.omit(str_count(data$languages.value, "C"))) - CSS - Cplus)
PHP <- sum(na.omit(str_count(data$languages.value, "PHP")))
Go <- sum(na.omit(str_count(data$languages.value, "Go")))
TypeScript <- sum(na.omit(str_count(data$languages.value, "TypeScript")))
Other <- sum(na.omit(str_count(data$languages.value, "Other")))


languages <- data.frame(label=c(
  'JavaScript', 'Stata', 'HTML', 'CSS', 'Markdown',
  'Python', 'R', 'Java', 'Matlab', 'Julia', 'Rust',
  'Scala', 'C', 'C++', 'PHP', 'Go', 'TypeScript', 'Other'
  ),value=c(JavaScript, Stata, HTML, CSS, Markdown,
            Python, R, Java, Matlab, Julia, Rust,
            Scala, C, Cplus, PHP, Go, TypeScript, Other))


ggplot(languages, aes(x=factor(label, level = rev(c(
  'JavaScript', 'Stata', 'HTML', 'CSS', 'Markdown',
  'Python', 'R', 'Java', 'Matlab', 'Julia', 'Rust',
  'Scala', 'C', 'C++', 'PHP', 'Go', 'TypeScript', 'Other'))), y=value)) +
  geom_bar(stat = "identity",width=0.3) + theme_minimal() + coord_flip() +
  ggtitle('Which of the following computer languages \n have you already used?') +
    xlab("") + ylab("") +
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("./plots/languages.png", width = 30, height = 20, units = "cm")

###################

Never <- sum(na.omit(str_count(data$programming.value, "Never")))
Beginner <- sum(na.omit(str_count(data$programming.value, "Beginner")))
Intermediate <- sum(na.omit(str_count(data$programming.value, "Intermediate")))
Advanced <- sum(na.omit(str_count(data$programming.value, "Advanced")))
Matrix <- sum(na.omit(str_count(data$programming.value, "Matrix")))

programming <- data.frame(label=c('Never programmed', 'Beginner',
                                  'Intermediate', 'Advanced', 'I created the Matrix'),
                                  value=c(Never, Beginner,
                                  Intermediate, Advanced, Matrix))


ggplot(programming, aes(x=factor(label, level = c('Never programmed', 'Beginner',
                                                   'Intermediate', 'Advanced',
                                                    'I created the Matrix')),
                         y=value)) +
  geom_bar(stat = "identity",width=0.3) + theme_minimal() + coord_flip() +
  ggtitle('How skillful of a programmer you are \n in your favorite programming language?') +
  xlab("") + ylab("") +
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("./plots/programming.png", width = 30, height = 20, units = "cm")

###################

Atom <- sum(na.omit(str_count(data$editor.value, "Atom")))
Visual <- sum(na.omit(str_count(data$editor.value, "Visual")))
RS <- sum(na.omit(str_count(data$editor.value, "R")))
Sublime <- sum(na.omit(str_count(data$editor.value, "Sublime")))
Other <- sum(na.omit(str_count(data$editor.value, "Other")))
Text <- sum(na.omit(str_count(data$editor.value, "Text")))

editor <- data.frame(label=c('Atom', 'Visual Studio Code', 'R Studio', 'Sublime', 'Other',
                             'Text Editor?'),value=c(Atom, Visual, RS, Sublime, Other,
                                                     Text))


ggplot(editor , aes(x=label, y=value)) +
  geom_bar(stat = "identity",width=0.3) + theme_minimal() + coord_flip() +
  ggtitle('What text editor do you usually use for programming?') +  xlab("") + ylab("") +
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("./plots/editor.png", width = 30, height = 20, units = "cm")

###################

Yes <- sum(na.omit(str_count(data$terminal.value , "Yes")))
No <- sum(na.omit(str_count(data$terminal.value , "No")))
Terminal <- sum(na.omit(str_count(data$terminal.value , "Terminal")))

terminal <- data.frame(label=c('Yes',  'No', 'Terminal?'),value=c(Yes, No, Terminal))

ggplot(terminal, aes(x=factor(label, level = c('Yes',  'No', 'Terminal?')), y=value)) +
  geom_bar(stat = "identity",width=0.3) + theme_minimal() +
  ggtitle("Would you say that you are confortable \n using a Terminal?") +  xlab("") +
  ylab("") +
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("./plots/terminal.png", width = 20, height = 20, units = "cm")

###################

Arrow <- sum(na.omit(str_count(data$js.value , "Arrow")))
Map <- sum(na.omit(str_count(data$js.value , "Map")))
Restful <- sum(na.omit(str_count(data$js.value , "Restful")))
jQuery <- sum(na.omit(str_count(data$js.value , "jQuery")))
Bootstrap <- sum(na.omit(str_count(data$js.value , "Bootstrap")))
Cordova <- sum(na.omit(str_count(data$js.value , "Cordova")))
Ionic  <- sum(na.omit(str_count(data$js.value , "Ionic")))
ExpressJS <- sum(na.omit(str_count(data$js.value , "ExpressJS")))
Asynchronous  <- sum(na.omit(str_count(data$js.value , "Asynchronous")))
Debugger <- sum(na.omit(str_count(data$js.value , "Debugger")))
React <- sum(na.omit(str_count(data$js.value , "React")))
Angular <- sum(na.omit(str_count(data$js.value , "Angular")))
Developer  <- sum(na.omit(str_count(data$js.value , "Developer")))
Git <- sum(na.omit(str_count(data$js.value , "Git")))
Heroku <- sum(na.omit(str_count(data$js.value , "Heroku")))

js <- data.frame(label=c('Arrow functions', 'Map-reduce patterns', 'Restful APIs',
                         'jQuery', 'Bootstrap', 'Cordova', 'Ionic Framework',
                         'ExpressJS', 'Asynchronous functions', 'Debugger',
                         'React', 'Angular', 'Developer Console', 'Git', 'Heroku'),
                 value=c(Arrow, Map, Restful,
                         jQuery, Bootstrap, Cordova, Ionic,
                         ExpressJS, Asynchronous, Debugger,
                         React, Angular, Developer, Git, Heroku))

ggplot(js, aes(x=factor(label, level = c('Arrow functions', 'Map-reduce patterns', 'Restful APIs',
                                         'jQuery', 'Bootstrap', 'Cordova', 'Ionic Framework',
                                         'ExpressJS', 'Asynchronous functions', 'Debugger',
                                         'React', 'Angular', 'Developer Console', 'Git',
                                          'Heroku')) , y=value)) +
  geom_bar(stat = "identity",width=0.3) + theme_minimal() + coord_flip() +
  ggtitle('During your journey in computer programming \n have you ever encountered:') +
    xlab("") + ylab("") +
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("./plots/js.png", width = 30, height = 20, units = "cm")

###################

Web <- sum(na.omit(str_count(data$project.value , "Web")))
Chrome <- sum(na.omit(str_count(data$project.value , "Chrome")))
Mobile  <- sum(na.omit(str_count(data$project.value , "Mobile")))
Behavioral  <- sum(na.omit(str_count(data$project.value , "Behavioral")))
Widget  <- sum(na.omit(str_count(data$project.value , "Widget")))
Collect <- sum(na.omit(str_count(data$project.value , "Collect")))
Not <- sum(na.omit(str_count(data$project.value , "Not")))

project <-  data.frame(label=c('Web app',
                               'Chrome extension',
                               'Mobile app',
                               'Behavioral Experiment / \nSurvey (like this one)',
                               'Widget Instrument for NodeGame',
                               'Collect data from public API / \n web scraping',
                               'Not quite sure yet'),value=c(Web, Chrome, Mobile, Behavioral,
                                                             Widget, Collect, Not))

ggplot(project, aes(x=factor(label, level =c('Web app',
                                             'Chrome extension',
                                             'Mobile app',
                                             'Behavioral Experiment / \nSurvey (like this one)',
                                             'Widget Instrument for NodeGame',
                                             'Collect data from public API / \n web scraping',
                                             'Not quite sure yet')), y=value)) +
  geom_bar(stat = "identity", width=0.3) + theme_minimal() + coord_flip() +
  ggtitle('I would like to create a:') +  xlab("") + ylab("") + 
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("./plots/project.png", width = 30, height = 20, units = "cm")

###################
age <- na.omit(data.frame(rep("All Participants",n), data$age.value))
age2 <- na.omit(data.frame(data$grade.value, data$age.value))

ggplot(age, aes(x =age[,1], y=age[,2])) +
  geom_boxplot(width=0.3) + theme_minimal() +
  ggtitle("What is your age?") +  xlab("") + ylab("") +
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("./plots/age.png", width = 20, height = 20, units = "cm")

ggplot(age, aes(x =age2[,1], y=age2[,2])) +
  geom_boxplot(width=0.3) + theme_minimal() +
  ggtitle("What is your age?") +  xlab("") + ylab("") +
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("./plots/age1.png", width = 20, height = 20, units = "cm")
