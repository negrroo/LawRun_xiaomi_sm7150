	    export ARCH=arm64
            export ANDROID_MAJOR_VERSION=r
            export KBUILD_BUILD_USER=Karou
            export KBUILD_BUILD_HOST=Playground
            export CROSS_COMPILE=$(pwd)/toolchain/bin/aarch64-linux-gnu-
            export CROSS_COMPILE_ARM32=$(pwd)/toolchain/bin/arm-linux-gnueabi-
	    
	    echo "_________________________________________________"
	    echo "=             VantomBE for davinci              ="
	    echo "=                Developer: Karou               ="
	    echo "=                                               ="
	    echo "=     Compiling kernel using Proton Clang 13    ="
	    echo "=---------------------------------------------- ="
	    echo "=     > ARM64 Toolchain exported                ="
	    echo "=     > ARM32 Toolchain exported                ="
	    echo -e "=_______________________________________________="
	
	    make O=out ARCH=arm64 ANDROID_MAJOR_VERSION=r davinci_defconfig
	    PATH="$(pwd)/toolchain/bin:$(pwd)/toolchain/bin:${PATH}" \
	    make -j$(nproc --all) O=out \
	    ARCH=arm64 \
	    ANDROID_MAJOR_VERSION=r \
	    CC=clang \
	    LD_LIBRARY_PATH="$(pwd)/toolchain/lib:$LD_LIBRARY_PATH" \
	    CLANG_TRIPLE=aarch64-linux-gnu- \
	    CROSS_COMPILE=aarch64-linux-gnu- \
	    CROSS_COMPILE_ARM32=arm-linux-gnueabi-

	    echo "_________________________________________________"
            echo "=               build completed                 ="
	    echo "================================================="
            
