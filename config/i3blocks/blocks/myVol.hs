import System.Environment


main = do
    s <- getArgs
    let vol = parseArgsForVol s
    putStrLn $ show vol

parseArgsForVol :: [String] -> Integer
parseArgsForVol [l] = 1 
parseArgsForVol _ = error "you cant do dis"
