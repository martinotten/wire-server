{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}

module V19 (migration) where

import Cassandra.Schema
import Control.Monad (void)
import Text.RawString.QQ

migration :: Migration
migration = Migration 19 "Add properties" $ do
    void $ schema' [r|
        create columnfamily if not exists properties
            ( user   uuid
            , key    ascii
            , value  blob
            , primary key (user, key)
            );
       |]
