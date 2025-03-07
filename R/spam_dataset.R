#' Spam Dataset Loader

#' @return A torch dataset object.
#' @examples
#' dataset = spam_dataset()
#' print(dataset$.getitem(1))

spam_dataset = dataset(
  name = "SpamDataset",
  
  initialize = function(download = TRUE) {
    self$url = "https://hastie.su.domains/ElemStatLearn/datasets/spam.data"
    
    # Load dataset from URL
    temp_file = tempfile(fileext = ".csv")
    download.file(self$url, temp_file)
    self$data = read.table(temp_file, header = FALSE)

    # Convert data to matrix
    self$x = as.matrix(self$data[, -ncol(self$data)])
    self$y = as.numeric(self$data[, ncol(self$data)]) + 1  # Shift labels to 1-based indexing

    # Normalize data
    data_mean = colMeans(self$x)
    data_sd = apply(self$x, 2, sd)
    self$x = scale(self$x, center = data_mean, scale = data_sd)

    # Convert to torch tensors
    self$x = torch_tensor(self$x, dtype = torch_float())
    self$y = torch_tensor(self$y, dtype = torch_long())
  },
  
  .getitem = function(index) {
    list(x = self$x[index, ], y = self$y[index])
  },
  
  .length = function() {
    self$y$size(1)
  }
)

dataset = spam_dataset()
print(dataset$.getitem(1))
