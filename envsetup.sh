	    echo "Getting environment ready for kernel"
            git config --global user.name "Sleppyiecat"
            git config --global user.email "mruczek70@gmail.com"         
            sudo -E apt-get -qq update
            sudo -E apt-get -qq install bc build-essential zip libstdc++6 git wget gcc clang libssl-dev repo rsync flex curl ccache bison aria2
            git clone https://github.com/kdrag0n/proton-clang --depth=1 -b master toolchain
