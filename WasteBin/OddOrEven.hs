oddOrEven :: Integral a => [a] -> String
oddOrEven []   = "even"
oddOrEven list = if odd $ sum list then "odd" else "even"