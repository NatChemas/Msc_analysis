Facial emotion processing as predictor of relapse after antidepressant withdrawal

Background
Depression is a major health issue and a substantial proportion of cases arise through relapses and chronic courses; more than half of those with a first episode of depression
will have a second, and the majority of them will have further episodes. Guidelines currently recommend a continuation of treatment after an initial response for 4 to 9
months and maintenance treatment for 2 years or longer in the case of recurrent major depressive disorder. The main indices that are used to inform the termination of
maintenance treatment are the treatment duration and the number of prior episodes or chronicity. Hence, it is critical to establish predictors of relapse, in order to determine the
individual's risk of relapsing after antidepressant discontinuation. This requires predictive variables to differentiate between those who are more likely to relapse and those who are
not.
Several studies have investigated emotion perception deficits and their relevance in patients with depression, as well as responsiveness to emotion expression controlling for
various antidepressant medications using a wide range of behavioural tasks. However, there are no studies examining emotion recognition affected in patients with remitted
depression, and bias in emotional processing as predictors of relapse in patients who discontinue antidepressant treatment.

Research questions
1. Does the Facial Emotion Recognition Task (FERT) predict relapse at 6 months follow up after discontinuation of antidepressant medication?
2. Are there any group differences in task performance in remitted depressed participants compared to controls at baseline?
3. Are there any differences in task performance in remitted depressed participants who discontinued antidepressant treatment compared to those who continue taking antidepressant medication?

Method
The Emotion Recognition Task measures the ability to identify six basic emotions in facial expressions along a continuum of expression magnitude. 
Participants select which emotion the face display from 6 options (sadness, happiness, fear, anger, disgust or surprise). 
The outcome measures for FERT cover percentages and numbers correct or incorrect and overall response latencies. 
Participants who had had depression; had responded to an antidepressant were stably remitted and wanted to discontinue the medication were recruited. 
They were then randomized into one of two groups: 12W or 1W2. Both groups underwent a baseline assessment followed by the first main assessment, compromising a variety of assessments including FERT. 
Thereafter, group 1W2 discontinued their medication over up to 16 weeks, and then underwent a repeat main assessment. 
Group 12W continued taking their medication and discontinued after the second main assessment. Both groups were followed up for 6 months after completion of the discontinuation. 
A third group of healthy control participants underwent the baseline and first main assessment only.

Analysis
First, means for clinical variables will be calculated. Data will be explored using graphs and descriptive statistics to assess for normality, outliers, and to check data quality.
Baseline clinical characteristics between patients and controls will be compared using independent samples t-tests.

1. Load FERT data into Matlab and perform quality control
 a. Calculate all % correct emotion recognition
 b. Remove subjects who are below chance across emotions
 c. Remove subjects who have too many missing data points (outliers)

2. For each of the following groups:
 a. All patients
 b. Dropout patients
 c. Patients with complete data
 d. Controls
 e. Patients with relapse
 f. Patients without relapse

Compute baseline variables (age, sex, number of prior episodes, severity, residual depression symtpoms and anxiety symptoms) and look for group differences using appropriate tests.

3. Patient / control comparison. For each FERT emotion, do:
 a. t-test comparing patients and controls
 b. correct the p-values for the number of comparisons (Bonferroni)

4. Relapse prediction using proportion correct on FERT emotions
 a. Cox proportional hazard with multiple linear regression using all six FERT proportion correct responses as predictors
 b. Cox proportional hazard with multiple linear regression using all six FERT proportion correct responses as predictors and any variables associated with dropout or relapse.

5. Effect of discontinuation on FERT. For each emotion, do:
 a. ANOVA of percent correct with factors time and group
