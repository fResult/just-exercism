{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_hello_world (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,1,0,5] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/fresult/Documents/projects/practices/just-exercism/haskell/hello-world/.stack-work/install/aarch64-osx/854a68b0b7ecd1e348fb05354790b397fd7bc6635d52ae549830c21913bbe2bb/9.6.7/bin"
libdir     = "/Users/fresult/Documents/projects/practices/just-exercism/haskell/hello-world/.stack-work/install/aarch64-osx/854a68b0b7ecd1e348fb05354790b397fd7bc6635d52ae549830c21913bbe2bb/9.6.7/lib/aarch64-osx-ghc-9.6.7/hello-world-1.1.0.5-Gq58M9Gmm1X5Qqu1yroZ4S-test"
dynlibdir  = "/Users/fresult/Documents/projects/practices/just-exercism/haskell/hello-world/.stack-work/install/aarch64-osx/854a68b0b7ecd1e348fb05354790b397fd7bc6635d52ae549830c21913bbe2bb/9.6.7/lib/aarch64-osx-ghc-9.6.7"
datadir    = "/Users/fresult/Documents/projects/practices/just-exercism/haskell/hello-world/.stack-work/install/aarch64-osx/854a68b0b7ecd1e348fb05354790b397fd7bc6635d52ae549830c21913bbe2bb/9.6.7/share/aarch64-osx-ghc-9.6.7/hello-world-1.1.0.5"
libexecdir = "/Users/fresult/Documents/projects/practices/just-exercism/haskell/hello-world/.stack-work/install/aarch64-osx/854a68b0b7ecd1e348fb05354790b397fd7bc6635d52ae549830c21913bbe2bb/9.6.7/libexec/aarch64-osx-ghc-9.6.7/hello-world-1.1.0.5"
sysconfdir = "/Users/fresult/Documents/projects/practices/just-exercism/haskell/hello-world/.stack-work/install/aarch64-osx/854a68b0b7ecd1e348fb05354790b397fd7bc6635d52ae549830c21913bbe2bb/9.6.7/etc"

getBinDir     = catchIO (getEnv "hello_world_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "hello_world_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "hello_world_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "hello_world_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hello_world_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hello_world_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
