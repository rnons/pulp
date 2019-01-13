module Pulp.Utils where

import Prelude

import Data.Maybe (Maybe, maybe)
import Effect.Exception (Error, error)
import Control.Monad.Error.Class (class MonadError, throwError)

orErr :: forall m a. MonadError Error m => String -> Maybe a -> m a
orErr msg = maybe (throw msg) pure

throw :: forall m a. MonadError Error m => String -> m a
throw = throwError <<< error
