import System.IO (hFlush, stdout)
import System.Exit (exitSuccess)


mal_read = id

mal_eval = id

mal_print = putStrLn

mal_rep = mal_print . mal_eval . mal_read

main :: IO ()
main = do
  putStr "user> "
  -- This is needed for the compiled version!
  -- Else it prints:
  --  asdf
  --  used> asdf
  --  *Waits for input and repeats*
  hFlush stdout
  input <- getLine
  mal_rep input
  main
