-- This file include UserInformation and UserInformationList data type declaration, and their FromJSON/ToJSON instances.

-- Enable overloading od string literals using a type class, much like integer literals.
{-# LANGUAGE OverloadedStrings          #-}
-- This allows us to deriving Generic, and use auto-generated generic instances. 
{-# LANGUAGE DeriveGeneric              #-}
-- This allows us to write a data type like 'UserInformation{..}' when using it as the input of a function or instance, 
-- then we can directly use its functions (userName, userPhone, etc.) as data instead using 'userName (ui :: UserInformation)'. see #31
{-# LANGUAGE RecordWildCards            #-}

module Types
    ( HomePageEntry (..)
    , HomePageEntryList (..)
    ) where 

import Data.Aeson 
-- import Data.Text (Text)
import GHC.Generics (Generic)


data HomePageEntry = HomePageEntry
    { hpTitle     :: !String
    , hpThumbnail :: !String
    , hpType      :: !String
    , hpLink      :: !String
    } deriving (Show)



--instance ToJSON HomePageEntry
instance ToJSON HomePageEntry where
    toJSON HomePageEntry{..} = 
        object [ "title"     .= hpTitle
               , "thumbnail" .= hpThumbnail
               , "type"      .= hpType
               , "link"      .= hpLink
               ]



instance FromJSON HomePageEntry where
    parseJSON = withObject "HomePageEntry" $ \o ->
        HomePageEntry <$> o .: "title"
                      <*> o .: "thumbnail"
                      <*> o .: "type"
                      <*> o .: "link"


newtype HomePageEntryList = HomePageEntryList
    { hpList  :: [HomePageEntry]
    } deriving (Show, Generic)


instance FromJSON HomePageEntryList


instance ToJSON HomePageEntryList
