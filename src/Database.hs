{-# LANGUAGE OverloadedStrings #-}

module Database
    (getData) where

import Types

import Database.MySQL.Base
import Data.Word
import Data.Binary.Put
import Data.Text



import qualified System.IO.Streams as Streams
import Data.ByteString.Lazy.Char8 as S8

getData :: IO [HomePageEntry]
getData = do 
    conn <- connect mySQLConnInfo
    (defs1, is1) <- query_ conn "SELECT title, litpic, description, senddate, id FROM dede_archives WHERE typeid = 1" -- 热点资讯
    -- (defs2, is2) <- query_ conn "SELECT title, litpic, description, senddate, id FROM dede_archives WHERE typeid = 2" -- 新闻
    -- (defs3, is3) <- query_ conn "SELECT title, litpic, description, senddate, id FROM dede_archives WHERE typeid = 3" -- 研究热点
    -- (defs4, is4) <- query_ conn "SELECT title, litpic, description, senddate, id FROM dede_archives WHERE typeid = 4" -- 视频资讯
    -- (defs5, is5) <- query_ conn "SELECT title, litpic, description, senddate, id FROM dede_archives WHERE typeid = 5" -- 热门技术

    list1 <- Streams.toList is1
    let entries = Prelude.map convert list1  -- :: [[String]]
    return entries
    -- lists2 <- Streams.toList is2
    -- lists3 <- Streams.toList is3
    -- lists4 <- Streams.toList is4
    -- lists5 <- Streams.toList is5


convert :: [MySQLValue] -> HomePageEntry
convert a =  
    let strs = Prelude.map (S8.unpack.runPut.putTextField) a 
    in HomePageEntry {hpTitle = strs!!0, hpThumbnail = strs!!1, hpType = "1", hpLink = sampleLink}
   


mySQLConnInfo = ConnectInfo 
    { ciHost = "db011e.feisu.space"
    , ciPort = 3306
    , ciDatabase = "a0912112304"
    , ciUser = "a0912112304"
    , ciPassword = "f9739de6"
    , ciCharset = 224
    }

sampleLink :: String 
sampleLink = "http://www.google.com"