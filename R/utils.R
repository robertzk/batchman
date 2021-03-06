batches <- structure(list(), class = "no_batches")
done <- list("new_call" = structure(list(), class = "batchman.is.done"))

#' A helper method to determine if batches doesn't contain batches.
#' @param batches The object to see if it contains batches.
is.no_batches <- function(batches) is(batches, "no_batches")

#' A helper method to determine if an empty batch was scheduled to run.
#' @param batches The object to see if it contains batches.
is.emptyrun <- function(x) identical(x, structure(NULL, emptyrun = TRUE))

#' A helper method to determine if batchman is done batching.
#' @param call The batchman call object.
is.done <- function(call) is(call, "batchman.is.done")

#' A helper method to determine if a function is already batched.
#' @param fn function. The function to test.
#' @export
is.batched_fn <- function(fn) isTRUE(attr(fn, "batched"))

#' A helper method to get the pre-batched function of a batched function.
#' @param fn function. The batched function to look for.
#' @export
get_before_fn <- function(fn) environment(fn)$batch_fn

#' @rdname get_before_fn
#' @export
unbatched <- get_before_fn

#' Print batched functions as they once were.
#' @param fn function. The function to print.
#' @export
print.batched_function <- function(fn) print(list(before_fn = get_before_fn(fn), after_fn = body(fn)))


#' Converts a number to an ordinal (e.g., first, second, etc.)
#' @param num numeric. The number to convert to ordinal.
#' @export
as.ordinal <- function(num) {
  ordinals <- list('first', 'second', 'third', 'fourth', 'fifth',
    'sixth', 'seventh', 'eighth', 'ninth', 'tenth', 'eleventh',
    'twelfth', 'thirteenth', 'fourteenth', 'fifteenth',
    'sixteenth', 'seventeenth', 'eighteenth', 'nineteenth',
    'twentieth')
  ext <- c("th", "st", "nd", "rd", rep("th", 6))
  ordinals[num][[1]] %||%
  paste0(num, ext[[(num %% 10) + 1]])
}
