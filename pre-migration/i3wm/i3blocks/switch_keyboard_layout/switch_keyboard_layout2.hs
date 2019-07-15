--
--   Copyright (c) 2019 Alex Watt
--   Licensed under the terms of the GNU GPL v2 only.
--
-- switch_keyboard_layout is an i3blocks blocklet script to manage your
-- current keyboard layout
{-# Language OverloadedStrings #-}

import System.Process
import System.Environment
import qualified Data.Text as T
import GHC.IO.Handle

data AppConfig = AppConfig
  { preferredLayouts :: [String]
  , bookletWasClicked :: Bool
  }

envBlockButton = lookupEnv "BLOCK_BUTTON"
envBlockInstance = lookupEnv "BLOCK_INSTANCE"

main = do
  bookletClicked <- fmap (maybe False (const True)) envBlockButton
  preferredLayouts' <- fmap (return $ fmap desiredLayouts) envBlockInstance
  cl <- currentLayout

  let config = AppConfig { preferredLayouts = preferredLayouts'
                         , bookletWasClicked = bookletClicked
                         }

  if bookletClicked
    then setNextLayout cl
    else putStrLn cl

currentLayout = do
  (_,Just hout,_,_) <- createProcess (proc "setxkbmap" ["-query"]) { std_out = CreatePipe }
  contents <- hGetContents hout
  let lines = T.split (== '\n') $ T.pack contents
  let layoutLine = head $ dropWhile (not . T.isPrefixOf "layout") lines
  return $ T.unpack $ last $ T.splitOn " " layoutLine

desiredLayouts :: String -> [String]
desiredLayouts commaSepLayouts =
  let extractLayouts = T.split (== ',') . T.pack in
  let convertToString = maybe [] (map T.unpack ) in
  let layouts = convertToString $ fmap (extractLayouts) commaSepLayouts in
  layouts

blockletWasClicked :: IO Bool
blockletWasClicked = do
  clickButton <- lookupEnv "BLOCK_BUTTON"
  return $ maybe False (const True) clickButton

setNextLayout cur preferredLayouts = do
  let ls = preferredLayouts

  let ls' = dropWhile (not . (== cur)) $ cycle ls
  let newCur = head $ drop 1 ls'

  createProcess (proc "setxkbmap" ["-layout", newCur])
  putStrLn newCur
