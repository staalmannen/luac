APE=/sys/src/ape
<$APE/config

TARG=luac 

BIN=/$objtype/bin/ape

OFILES=\
    luac.$O \
    
HFILES=\
    /sys/include/ape/lauxlib.h \
    /sys/include/ape/lua.h \
    /sys/include/ape/luaconf.h \
    /sys/include/ape/lualib.h 

UPDATE=\
	mkfile\
	$HFILES\
	${OFILES:%.$O=%.c}\
	/$objtype/lib/ape/liblua.a

</sys/src/cmd/mkone

CC=pcc
LD=pcc
CFLAGS= -c -I. -I../lua -D_C99_SNPRINTF_EXTENSION -D_POSIX_SOURCE \
        -D_SUSV2_SOURCE -DLUA_POSIX -DENABLE_CJSON_GLOBAL \
        -DPlan9 -DMAKE_LUAC

install:V:
        cp $O.out /$objtype/bin/ape/luac
        
nuke:V:
        rm -f /$objtype/bin/ape/luac
        

