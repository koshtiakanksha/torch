\name{spam_dataset}
\alias{spam_dataset}
\title{Spam Dataset Loader}
\description{
Loads the Spam Dataset from the UCI Machine Learning Repository for spam email detection. 
This dataset is commonly used for binary classification tasks (spam vs. non-spam).
}
\usage{
spam_dataset(download = TRUE)
}
\arguments{
  \item{download}{Logical. If TRUE, downloads the dataset from the official source.}
}
\details{
The dataset contains **57 features** extracted from email text, including frequency of certain words and characters. 
The last column represents the binary label: **1 for spam, 0 for non-spam**.
The function automatically converts the dataset into **torch tensors** and normalizes the feature values.
}
\return{
Returns a dataset object compatible with \code{torch::dataloader()}.
}
\examples{
# Load dataset
dataset = spam_dataset()

# Get dataset length
dataset$.length()

# Retrieve the first sample
sample = dataset$.getitem(1)

# Print features and label
print(sample$x)  # Feature tensor
print(sample$y)  # Label tensor
}
