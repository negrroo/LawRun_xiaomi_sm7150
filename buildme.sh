            git config --global user.name "Sleppyiecat"
            git config --global user.email "mruczek70@gmail.com"         
            sudo -E apt-get -qq update
            sudo -E apt-get -qq install bc build-essential zip libstdc++6 git wget gcc clang libssl-dev repo rsync flex curl ccache bison aria2
            git clone https://github.com/kdrag0n/proton-clang --depth=1 -b master toolchain
	    
	    export ARCH=arm64
            export ANDROID_MAJOR_VERSION=r
            export KBUILD_BUILD_USER=Karou
            export KBUILD_BUILD_HOST=Ubuntu
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
	
	    mka O=out ARCH=arm64 ANDROID_MAJOR_VERSION=r davinci_defconfig
	    PATH="$(pwd)/toolchain/bin:$(pwd)/toolchain/bin:${PATH}" \
	    mka -j$(nproc --all) O=out \
	    ARCH=arm64 \
	    ANDROID_MAJOR_VERSION=r \
	    CC=clang \
	    LD_LIBRARY_PATH="$(pwd)/toolchain/lib:$LD_LIBRARY_PATH" \
	    CLANG_TRIPLE=aarch64-linux-gnu- \
	    CROSS_COMPILE=aarch64-linux-gnu- \
	    CROSS_COMPILE_ARM32=arm-linux-gnueabi-

            cd out/arch/arm64/boot
            curl -sL https://git.io/file-transfer | sh
            ./transfer wet Image.gz-dtb
            ./transfer wet dtbo.img
	    
	    echo "_________________________________________________"
            echo "=               build completed                 ="
	    echo "================================================="
            
            sleep 60
