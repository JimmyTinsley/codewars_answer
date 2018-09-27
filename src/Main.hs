-- This is the main module of the program. Cabal will generate executable file from this main file.

{-# LANGUAGE OverloadedStrings #-}
--{-# LANGUAGE QuasiQuotes       #-}

module Main 
    ( main
    ) where

-- Other two modules of the program
import Types 
import Database

-- Modules needed
import Control.Monad
import Data.Aeson
import Network.HTTP.Types
import Network.Wai
import Network.Wai.Handler.Warp (run)
import System.Environment (getArgs)
import System.Directory (findFile)
import Data.Maybe (isNothing)

-- Use functions (pack, unpack) and type (ByteString) of this package
import qualified Data.ByteString.Lazy.Char8 as S8

-- The main funtion
main :: IO ()
main = do
    -- Custom port number
    args <- getArgs
    let port = (read $ head args) :: Int 
    -- Create database tables if they don't exist. 
    -- Run the main app
    putStrLn "Server Started."
    run port app
    
-- The main app is used to handle pathInfo and method for requests. 
-- For path "get"  method "Get"  request, handleGetRequest  function will handle and process it.
-- For path "post" mehtod "Post" request, handlePostRequest function will handle and process it.

-- If the pathInfo is neither "get" nor "post", the app will return 404 "Not Found".
-- If the method is not "Get" for a "get"-path-request, or "Post" for a "post"-path-request, 
-- the app will return 405 "Method Not Allowed"

app :: Application   -- Application :: Request -> (Response -> IO ResponseReceived) -> IO ResponseReceived
app req send = 
    case pathInfo req of 
        ["get"]  -> if requestMethod req == methodGet
                    then handleGetRequest req send
                    else send $ responseLBS   -- Use responseLBS builder to build the respose 
                        status405 
                        [("Content-Type", "text/plain; charset=utf-8")]
                        "Mehtod Not Allowed"

        _        -> send $ responseLBS
            status404
            [("Content-Type", "text/plain; charset=utf-8")]
            "Not found"

-- Handle "Get" request
handleGetRequest :: Application
handleGetRequest _ send = do   -- we don't need any other thing in the request header or body
    -- Get the Users' Information (as UserInformationList type) from database 
    infoList <- getData  

    -- Encode them in standard json format.  UserInformationList -> Data.ByteString.Lazy.Char8.ByteString
    let responseByteString = encode infoList :: S8.ByteString

    -- Show the json information in log
    -- putStrLn $ S8.unpack responseByteString ------------ Set Optional

    -- Send the json as response, 200 OK
    send $ responseLBS 
            status200
            [("Content-Type", "application/json; charset=utf-8"), ("Access-Control-Allow-Origin", "*")]
            responseByteString




