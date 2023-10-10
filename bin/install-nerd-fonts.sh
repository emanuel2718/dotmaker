#!/bin/bash

declare -a fonts=(
    BitstreamVeraSansMono
    CodeNewRoman
    DroidSansMono
    FiraCode
    FiraMono
		EnvyCodeR
    Go-Mono
		Gohu
    Hack
    Hermit
		IosevkaTerm
    JetBrainsMono
    Meslo
    Noto
    Overpass
    RobotoMono
    SourceCodePro
		ShareTechMono
    SpaceMono
    Terminus
    Ubuntu
    UbuntuMono
		VictorMono
)

version='3.0.2'
fonts_dir="${HOME}/.local/share/fonts"

if [[ ! -d "$fonts_dir" ]]; then
    mkdir -p "$fonts_dir"
fi

for font in "${fonts[@]}"; do
    zip_file="${font}.zip"
    download_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/${zip_file}"
    echo "Downloading $download_url"
    wget "$download_url"
    unzip "$zip_file" -d "$fonts_dir"
    rm "$zip_file"
done

find "$fonts_dir" -name '*Windows Compatible*' -delete

fc-cache -fv
