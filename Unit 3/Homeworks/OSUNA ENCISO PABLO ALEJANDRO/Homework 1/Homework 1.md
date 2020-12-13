## What is machine learning?

Machine Learning is a scientific discipline in the field of Artificial Intelligence that creates systems that learn automatically. Learning in this context means identifying complex patterns in millions of data. The machine that really learns is an algorithm that reviews data and is capable of predicting future behavior. Automatically, also in this context, implies that these systems are improved autonomously over time, without human intervention. Let's see how it works.

## Where is machine learning used?

### Data security

Malware is a growing problem today. Despite the fact that new malware appears almost daily, they tend to have almost the same code as previous versions. In this way, machine learning can predict which files are malware with great precision. What's more, machine learning algorithms can look for patterns in how data is accessed in the cloud and report anomalies that could predict security breaches.

#### Personal security

Machine learning can also be an advantage in this regard. For example, it could serve to ease security controls at airports, as it can help eliminate false alarms and detect anomalies in security projections that the human eye may not see clearly; In short, it would speed up the process while ensuring greater security.

#### Financial trading

Predicting how the stock markets behave is the dream of many. Thanks to machine learning this could become a reality. Many companies in the industry already use their own systems to predict and execute high-volume operations at high speeds.

#### Health care

In a study using computer-aided diagnosis (CAD) to review the initial mammograms of women who later developed breast cancer, the computer detected 52% of cancers up to a year before the women were officially diagnosed. . This shows that machine learning algorithms can process more information and detect more patterns than a human mind. Additionally, machine learning can also be used to warn of disease risk factors in large populations.

### Personalized marketing

Personalized marketing is based on a simple principle: the more you can know about the customer and their behavior, the better they can be served and will translate into more sales. Machine learning can help, and a lot, to improve this base. For example, it is increasingly common that after viewing a product in an online store, an advertisement for the same product follows us later so that we can finalize the purchase. And not only that, companies can customize which emails a customer receives, what direct mails or coupons, what offers they see, what products are shown as "recommended", etc., all designed to lead the consumer more reliably towards a sale.

### Fraud detection

Machine learning is increasingly effective in detecting possible cases of fraud in different fields. PayPal already uses machine learning to combat money laundering; the company has tools that compare millions of transactions and can accurately distinguish between legitimate and fraudulent transactions, between buyers and sellers.

### Recommendations

If you are a user of platforms like Amazon, you already know what we are talking about. Machine learning algorithms allow us to analyze a user's activity and compare it with that of other users to determine what they would like to see or buy in the future. In this field the advances are incredible, for example, thanks to these algorithms the platform can detect that a user is buying an item that is not for him, but to give away.

### Online search

This is perhaps the most famous use of machine learning. Google and its competitors are constantly improving what the search engine understands. Every time a Google search is run, the program watches how it responds to the results. If a user clicks on the top result and stays on that web page, we can assume that they got the information they were looking for and that the search was successful.

### Natural Language Processing (NLP)

A less common application but one that is already being used in different disciplines. Natural language machine algorithms can replace customer service employees and more quickly direct users to the information they need. It is being used, for example, to translate unclear legal jargon in contracts into plain language and to help lawyers sort through large volumes of information to prepare for a case.

### Smart cars

According to an IBM study, it is expected that by 2025 we can already see smart cars on the road. In this sense, a smart car would not only be integrated into the Internet of Things, but would also learn about its owner and its environment. These vehicles could adjust internal settings (temperature, audio, seat position, etc.) automatically based on the driver, report and even troubleshoot, and drive and offer real-time advice on traffic and road conditions .

## What is linear regression for?

In linear regression, relationships are modeled by linear predictor functions whose unknown model parameters are calculated from the data. These models are called linear models. More commonly, the conditional mean of the response given the values ​​of the explanatory (or predictor) variables is assumed to be an affine function of those values; less frequently, the conditional median or some other quantile is used. Like all forms of regression analysis, linear regression focuses on the conditional probability distribution of the response given the values ​​of the predictors, rather than the joint probability distribution of all these variables, which is the domain of multivariate analysis.

Linear regression was the first type of regression analysis to be rigorously studied, and it was widely used in practical applications. This is because models that are linearly dependent on their unknown parameters are easier to fit than models that are not linearly related to their parameters, and because the statistical properties of the resulting estimators are easier to determine.

Linear regression has many practical uses. Most applications fall into one of the following two general categories:

If the goal is prediction, prevention, or reduction of errors, linear regression [clarification needed] can be used to fit a predictive model to an observed data set of response values ​​and explanatory variables. After developing such a model, if additional values ​​of the explanatory variables are collected without an attached response value, the fitted model can be used to make a response prediction.

If the objective is to explain the variation in the response variable that can be attributed to the variation in the explanatory variables, linear regression analysis can be applied to quantify the strength of the relationship between the response and the explanatory variables, and in particular to determine whether some explanatory variables may have no linear relationship to the response at all, or to identify which subsets of explanatory variables may contain redundant information about the response.

## Simple Linear Regression

We will use ggplot, we will use the geom_point, on the X axis we will use the data from test_set, where we only want to show the data from YearsExperience, on the Y axis of the test_set data, we will only use the Salary

In the geom_line, we will have the training_set data on the X axis, where we will only use YearsExperience and on the Y axis, we will use a prediction where the regressor and newdata would be equal to the training_set data

As the main title of the graph we will put Salary vs Experience (Test Set), the title of the X axis we will put Years of experience and on the Y axis Salary

![Rplot01](https://i.imgur.com/Jc4aZcH.png)

## References
Adam Geitgey. (2018). Machine Learning is Fun !. 08, December 2020, from Medium Website: https://medium.com/@ageitgey/machine-learning-is-fun-80ea3ec3c471

María González Dono. (2017). The 10 most common uses in machine learning and artificial intelligence. 08, Dec 2020. from Blogthinbig Website: The 10 Most Common Uses in Machine Learning and Artificial Intelligence (blogthinkbig.com)
