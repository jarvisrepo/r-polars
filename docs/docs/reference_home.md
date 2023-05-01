# Reference

`polars`' functions are divided in several categories.

## DataFrame and LazyFrame

Functions for these structures are stored in the `DataFrame` and `LazyFrame`
sections in the sidebar. They are used as follows:

```
<DataFrame>$head(n)
```

where `<DataFrame>` is a DataFrame created by the user. For instance, we could 
do:

```
test <- pl$DataFrame(iris)
test$head(3)

shape: (3, 5)
┌──────────────┬─────────────┬──────────────┬─────────────┬─────────┐
│ Sepal.Length ┆ Sepal.Width ┆ Petal.Length ┆ Petal.Width ┆ Species │
│ ---          ┆ ---         ┆ ---          ┆ ---         ┆ ---     │
│ f64          ┆ f64         ┆ f64          ┆ f64         ┆ cat     │
╞══════════════╪═════════════╪══════════════╪═════════════╪═════════╡
│ 5.1          ┆ 3.5         ┆ 1.4          ┆ 0.2         ┆ setosa  │
│ 4.9          ┆ 3.0         ┆ 1.4          ┆ 0.2         ┆ setosa  │
│ 4.7          ┆ 3.2         ┆ 1.3          ┆ 0.2         ┆ setosa  │
└──────────────┴─────────────┴──────────────┴─────────────┴─────────┘
```

Similarly, `GroupBy` and `LazyGroupBy` contains the functions applicable on
grouped `DataFrame`s and `LazyFrame`s.


## Expressions

`polars` comes with a number of built-in functions that allow the query engine 
to optimize the data processing. These functions, apply to different types of 
data: text, date-time, etc.

Functions in the "Expressions" category must be applied inside a `select()`. 
Two functions can have the same name but different behavior depending on whether
they are called on a `DataFrame` or in a `select()` expression. For example,
`first()` returns the first row if it is called on the `DataFrame` but it
returns the first column if it is called in `select()`.

```
test <- pl$DataFrame(iris)
test$first()
shape: (1, 5)
┌──────────────┬─────────────┬──────────────┬─────────────┬─────────┐
│ Sepal.Length ┆ Sepal.Width ┆ Petal.Length ┆ Petal.Width ┆ Species │
│ ---          ┆ ---         ┆ ---          ┆ ---         ┆ ---     │
│ f64          ┆ f64         ┆ f64          ┆ f64         ┆ cat     │
╞══════════════╪═════════════╪══════════════╪═════════════╪═════════╡
│ 5.1          ┆ 3.5         ┆ 1.4          ┆ 0.2         ┆ setosa  │
└──────────────┴─────────────┴──────────────┴─────────────┴─────────┘

test$select(pl$first())
shape: (150, 1)
┌──────────────┐
│ Sepal.Length │
│ ---          │
│ f64          │
╞══════════════╡
│ 5.1          │
│ 4.9          │
│ 4.7          │
│ 4.6          │
│ ...          │
│ 6.3          │
│ 6.5          │
│ 6.2          │
│ 5.9          │
└──────────────┘
```
