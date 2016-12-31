import System.Environment

usage :: IO()
usage = do
    putStrLn "Usage: fizzbuzz 1stDivisor 2ndDivisor UpperBound"
    putStrLn "Usage:   1stDivisor > 0"
    putStrLn "Usage:   2ndDivisor >= 1stDivisor"
    putStrLn "Usage:   UpperBound > 0"
    putStrLn "Usage:   Returns numbers between 1 and UpperBound"

numbers = map show [1..]
choice  = max

fizzes :: Int -> [String]
fizzes n 
    | n < 1     = cycle [""]
    | n == 1    = cycle ["Fizz"]
    | otherwise = cycle (replicate (n-1) "" ++ ["Fizz"])

buzzes :: Int -> [String]
buzzes n 
    | n < 1     = cycle [""]
    | n == 1    = cycle ["Buzz"]
    | otherwise = cycle (replicate (n-1) "" ++ ["Buzz"])

fizzBuzzWords :: Int -> Int -> [String]
fizzBuzzWords x y = zipWith (++) (fizzes x) (buzzes y)

fizzbuzz :: Int -> Int -> Int -> [String]
fizzbuzz x y z = take z (zipWith choice (fizzBuzzWords x y) numbers)


fb :: Int -> Int -> Int ->IO ()
fb x y z 
    | x < 1 = usage
    | y < x = usage
    | z <= 0 = usage
    | otherwise = mapM_ putStrLn (fizzbuzz x y z)

main = do
    args <- getArgs

    if length args == 3
        then do
            let firstDivisor  = read (args !! 0) :: Int
                secondDivisor = read (args !! 1) :: Int
                upperBound    = read (args !! 2) :: Int

            fb firstDivisor secondDivisor upperBound
        else
            usage

