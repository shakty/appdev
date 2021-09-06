
library(ggplot2)
install.packages("ggpubr")

###################

gender <- data.frame(label=c("Male","Female"),value=c(4,4))


ggplot(gender, aes(x=label, y=value)) + 
  geom_bar(stat = "identity",width=0.3) + theme_minimal() + 
  ggtitle("What is your gender?") +  xlab("") + ylab("") + ylim(0,6) + 
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("gender.png", width = 20, height = 20, units = "cm")

####################

discipline <- data.frame(label=c("Computational Social Sciences",
                                 "Economics", "Mechanical engineering", "Consumer Behaviour / \n Psychology",
                                 "Sociology "),value=c(2,2,2,1,1))

ggplot(discipline, aes(x=label, y=value)) + 
  geom_bar(stat = "identity",width=0.3) + theme_minimal() + coord_flip() +
  ggtitle('What is your core discipline?') +  xlab("") + ylab("") + ylim(0,3) +
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("discipline.png", width = 30, height = 20, units = "cm")

################

grade <- data.frame(label=c("Bachelor","Master"),value=c(4,4))

ggplot(grade, aes(x=label, y=value))  + 
  geom_bar(stat = "identity",width=0.3) + theme_minimal() + 
  ggtitle("What is your highest academic grade?") +  xlab("") + ylab("") + ylim(0,6) +
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("grade.png", width = 20, height = 20, units = "cm")

###################

languages <- data.frame(label=c(
  'JavaScript', 'Stata', 'HTML', 'CSS', 'Markdown',
  'Python', 'R', 'Java', 'Matlab', 'Julia', 'Rust',
  'Scala', 'C', 'C++', 'PHP', 'Go', 'TypeScript', 'Other'
  ),value=c(4,0,5,4,1,5,5,0,2,0,0,0,1,0,1,0,0,0))

ggplot(languages, aes(x=factor(label, level = rev(c(
  'JavaScript', 'Stata', 'HTML', 'CSS', 'Markdown',
  'Python', 'R', 'Java', 'Matlab', 'Julia', 'Rust',
  'Scala', 'C', 'C++', 'PHP', 'Go', 'TypeScript', 'Other'))), y=value)) + 
  geom_bar(stat = "identity",width=0.3) + theme_minimal() + coord_flip() +
  ggtitle('Which of the following computer languages \n have you already used?') +  xlab("") + ylab("") + ylim(0,6) +
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("languages.png", width = 30, height = 20, units = "cm")

###################

programming <- data.frame(label=c('Never programmed', 'Beginner',
                                  'Intermediate', 'Advanced', 'I created the Matrix'),value=c(1,2,4,1,0))

ggplot(programming, aes(x=factor(label, level = c('Never programmed', 'Beginner',
                                                   'Intermediate', 'Advanced', 'I created the Matrix')),
                         y=value)) + 
  geom_bar(stat = "identity",width=0.3) + theme_minimal() + coord_flip() +
  ggtitle('How skillful of a programmer you are \n in your favorite programming language?') +
  xlab("") + ylab("") + ylim(0,6) +
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("programming.png", width = 30, height = 20, units = "cm")

###################

editor <- data.frame(label=c('Atom', 'Visual Studio Code', 'R Studio', 'Sublime', 'Other',
                             'Text Editor?'),value=c(0,3,5,1,2,1))

ggplot(editor , aes(x=label, y=value)) + 
  geom_bar(stat = "identity",width=0.3) + theme_minimal() + coord_flip() +
  ggtitle('What text editor do you usually use for programming?') +  xlab("") + ylab("") + ylim(0,6)+
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("editor.png", width = 30, height = 20, units = "cm")

###################

terminal <- data.frame(label=c('Yes',  'No', 'Terminal?'),value=c(4,2,2))

ggplot(terminal, aes(x=factor(label, level = c('Yes',  'No', 'Terminal?')), y=value)) + 
  geom_bar(stat = "identity",width=0.3) + theme_minimal() + 
  ggtitle("Would you say that you are confortable \n using a Terminal?") +  xlab("") + ylab("") + ylim(0,6)+
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("terminal.png", width = 20, height = 20, units = "cm")

###################

js <- data.frame(label=c('Arrow functions', 'Map-reduce patterns', 'Restful APIs',
                         'jQuery', 'Bootstrap', 'Cordova', 'Ionic Framework',
                         'ExpressJS', 'Asynchronous functions', 'Debugger',
                         'React', 'Angular', 'Developer Console', 'Git', 'Heroku'),value=c(1,1,1,2,5,0,0,
                                                                                           0,1,3,0,0,1,7,1))
ggplot(js, aes(x=factor(label, level = c('Arrow functions', 'Map-reduce patterns', 'Restful APIs',
                                         'jQuery', 'Bootstrap', 'Cordova', 'Ionic Framework',
                                         'ExpressJS', 'Asynchronous functions', 'Debugger',
                                         'React', 'Angular', 'Developer Console', 'Git', 'Heroku')) , y=value)) + 
  geom_bar(stat = "identity",width=0.3) + theme_minimal() + coord_flip() +
  ggtitle('During your journey in computer programming \n have you ever encountered:') +  xlab("") + ylab("") + ylim(0,8)+
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("js.png", width = 30, height = 20, units = "cm")

###################

project <-  data.frame(label=c('Web app',
                               'Chrome extension',
                               'Mobile app',
                               'Behavioral Experiment / \n Survey',
                               'Not quite sure yet'),value=c(1,0,1,2,4))

ggplot(project, aes(x=factor(label, level =c('Web app',
                                             'Chrome extension',
                                             'Mobile app',
                                             'Behavioral Experiment / \n Survey',
                                             'Not quite sure yet')), y=value)) + 
  geom_bar(stat = "identity", width=0.3) + theme_minimal() + coord_flip() +
  ggtitle('I would like to create a:') +  xlab("") + ylab("") + ylim(0,6)+
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("project.png", width = 30, height = 20, units = "cm")

###################

prep <- data.frame(label=c('Yes', 'No'),value=c(7,1))

ggplot(prep, aes(x=label, y=value)) + 
  geom_bar(stat = "identity",width=0.3) + theme_minimal() + 
  ggtitle("Would you like a quick prep lecture \n before the beginning of the workshop?") +  xlab("") + ylab("") + ylim(0,8)+
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("prep.png", width = 20, height = 20, units = "cm")

###################
age <- na.omit(data.frame(rep("All Participants",9), data$age.value))
age2 <- na.omit(data.frame(data$grade.value, data$age.value))

ggplot(age, aes(x =age[,1], y=age[,2])) + 
  geom_boxplot(width=0.3) + theme_minimal() + 
  ggtitle("What is your age?") +  xlab("") + ylab("") + ylim(20,40) +
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("age.png", width = 20, height = 20, units = "cm")

ggplot(age, aes(x =age2[,1], y=age2[,2])) + 
  geom_boxplot(width=0.3) + theme_minimal() + 
  ggtitle("What is your age?") +  xlab("") + ylab("") + ylim(20,40) +
  theme(text = element_text(size=20),
        plot.margin = margin(0.5, 1, 1, 0.5, "cm"))

ggsave("age1.png", width = 20, height = 20, units = "cm")
