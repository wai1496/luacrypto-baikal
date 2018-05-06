-- This file was automatically generated for the LuaDist project.

package = "luacrypto-baikal"
version = "1.0-0"
description = {
	summary = "A Lua frontend to OpenSSL",
	detailed = [[LuaCrypto is a Lua frontend to the OpenSSL cryptographic library. The OpenSSL features that are currently exposed are: 
digests (MD5, SHA-1, HMAC, and more), encryption, decryption and crypto-grade random number generators.]],
	homepage = "http://mkottman.github.com/luacrypto/",
	license = "MIT",
}
dependencies = {
	"lua >= 5.1, < 5.3",
}
external_dependencies = {
	OPENSSL = {
		header = "openssl/evp.h"
	}
}
-- LuaDist source
source = {
  tag = "1.0-0",
  url = "git://github.com/LuaDist-testing/luacrypto-baikal.git"
}
-- Original source
-- source = {
-- 	url = "https://github.com/greatwolf/luacrypto/archive/master.zip",
-- 	dir = "luacrypto-master",
-- }
build = {
	type = "builtin",
	modules = {
		crypto = {
			sources = "src/lcrypto.c",
			incdirs = "$(OPENSSL_INCDIR)",
			libdirs = "$(OPENSSL_LIBDIR)",
			libraries = "crypto",
		}
	},
	platforms = {
		windows = {
			modules = { crypto = { libraries = {'libeay32', 'ssleay32', 'kernel32', 'user32', 'gdi32', 'advapi32'} } }
		}
	},
	copy_directories = { "doc" }
}
build.platforms.mingw32 = build.platforms.windows