import System.Environment


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
    | x < 1 = putStrLn ""
    | y < x = putStrLn ""
    | z <= 0 = putStrLn ""
    | otherwise = mapM_ putStrLn (fizzbuzz x y z)

main = do
    args <- getArgs

    let firstDivisor  = read (args !! 0) :: Int
        secondDivisor = read (args !! 1) :: Int
        upperBound    = read (args !! 2) :: Int

    fb firstDivisor secondDivisor upperBound



