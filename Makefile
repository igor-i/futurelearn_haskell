ifndef file
  ghci_command = ghci
else
  ghci_command = ghci /haskell/$(file)
endif

bash:
	docker run -it --rm -w=/haskell \
	  --mount src=`pwd`,target=/haskell,type=bind \
	  haskell:7.8 bash

ghci:
	docker run -it --rm -w=/haskell \
	  --mount src=`pwd`,target=/haskell/,type=bind \
	  haskell:7.8 $(ghci_command)
